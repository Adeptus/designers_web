require 'test_helper'

class UserStoriesTest < ActionController::IntegrationTest
  fixtures :all

  def test_create_designer_login_add_portfolio_add_project_logout
    Designer.delete_all
    Portfolio.delete_all

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

## jak sie odwolac kiedy metoda jest w application_controller? normalnie jest "/controller/action"
    post_via_redirect "/login", [:name => "Lolek", :password => "111"]
    assert_response :success

    session[:user_id] = Designer.find(:all).first.id 

    get "/portfolio/new"
    assert_response :success
    assert_template "new"

    post_via_redirect "/portfolio/create",
                      :portfolio => { :text => "Lolek portfolio"}
    assert_response :success
    assert_template "index"
    assert_equal 1, Portfolio.find(:all).count
  end

end
