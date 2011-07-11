require 'test_helper'

class UserStoriesTest < ActionController::IntegrationTest
  fixtures :all

  def test_create_designer_login_add_portfolio_add_project_logout
    Designer.delete_all
    Portfolio.delete_all
    Project.delete_all

    get "/designer/index"
    assert_response :success
    assert_template "index"    

    get "/designer/new"
    assert_response :success
    assert_template "new"

    post_via_redirect "/designer/create",
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

    get "/portfolio/new"
    assert_response :success
    assert_template "new"

    assert_equal 3, session[:user_id]

    post "/portfolio/create", :portfolio => "Lolek portfolio"
    assert_response :redirect
    assert_equal 1, Portfolio.find(:all).count
    assert_equal "Lolek portfolio", Portfolio.find(:all).first.text 

    get "/project/new"
    assert_response :success

    post "/project/create", :project => {:text => "JEST"}
    assert_response :redirect
    assert_equal 1, Portfolio.find(:all).first.projects.count

    post "/logout"
    assert_response :redirect
    assert_nil session[:user_id]
  end

end
