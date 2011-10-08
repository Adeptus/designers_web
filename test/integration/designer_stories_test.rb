require 'test_helper'

class DesignerStoriesTest < ActionController::IntegrationTest
  fixtures :all

  def test_create_designer_login_add_portfolio_add_project_and_logout
    Designer.delete_all
    Portfolio.delete_all
    Project.delete_all

    get "/designers"
    assert_response :success
    assert_template "index"    

    get "/designers/new"
    assert_response :success
    assert_template "new"

    post_via_redirect "/designers/create",
                      :designer => { :name         => "Lolek",
                                     :password     => "111",
                                     :tel          => 222,
                                     :image_url    => "check",
                                     :presentation => "elo elo" }    

    assert_response :success
    assert_template "index"
    assert_equal 1, Designer.find(:all).count
    assert_equal "Lolek", Designer.find(:all).first.name
    
    post "/login", :name => "Lolek", :password => "111"
    assert_response :redirect

    get "/portfolios/new"
    assert_response :success
    assert_template "new"

    assert_equal 3, session[:user_id]

    post "/portfolios/create", :portfolio => "Lolek portfolio"
    assert_response :redirect
    assert_equal 1, Portfolio.find(:all).count
    assert_equal "Lolek portfolio", Portfolio.find(:all).first.text 

    get "/projects/new"
    assert_response :success

    post "/projects/create", :project => {:text => "JEST"}
    assert_response :redirect
    assert_equal 1, Portfolio.find(:all).first.projects.count

    post "/logout"
    assert_response :redirect
    assert_nil session[:user_id]
  end

  def test_designer_vote_project_and_next_update_vote_story
    @designer = Designer.find(designers(:aaa))
  
    post_via_redirect "/login", :name => @designer.name, :password => @designer.password
    assert_equal '/designers', path
    assert_equal 'Hello Czarnuch', flash[:notice] 

    get "projects/3"
    assert_response :success
    assert_template "show"
    assert_equal [], @designer.ratings

    post_via_redirect "ratings/create", {:rating => 2,
                                         :project_id => 3,
                                         :designer_id => @designer.id}
    assert_response :success
    assert_template "show"
    assert_equal 2, @designer.ratings.find(:first, :conditions => {
                                                   :project_id => 3}).value

    post_via_redirect "ratings/update", {:rating => 1,
                                         :project_id => 3,
                                         :designer_id => @designer.id}

    assert_equal 1, @designer.ratings.find(:first, :conditions => {
                                                   :project_id => 3}).value
  end

  def test_guest_search_project

    get "projects"
    assert_response :success
    assert_template "index"
    assert assigns(:projects)

    assert_equal 3, assigns(:projects).count

    get "projects?search=Kowals"
    assert_response :success
    assert_template "index"

    assert_equal 1, assigns(:projects).count
    assert_match /Kowals/, assigns(:projects).first.text
  end

  def test_guest_sort_projects

    get "projects"
    assert_response :success
    assert_template "index"
    assert assigns(:projects)

    assert_match /Editor/ , assigns(:projects).first.text
    assert_equal 4.0 , assigns(:projects).first.score

    get "projects?order=score&direction=asc"
    assert_response :success
    assert_template "index"

    assert_match /MyString/ , assigns(:projects).first.text
    assert_nil assigns(:projects).first.score
  end
end
