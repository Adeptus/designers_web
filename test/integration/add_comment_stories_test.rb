require 'test_helper'

class UserStoriesTest < ActionController::IntegrationTest
  fixtures :all

  def test_create_designer_login_add_portfolio_add_project_logout

    get "/designer/index"
    assert_response :success
    assert_template "index"    

    post "/login", :name => designers(:aaa).name,
                   :password => designers(:aaa).password


    get "/portfolio/index"
    assert_response :success
    assert_template "index"    

    assert_equal 0, Project.find(1).comments.count
    post "/comment/create", :text => "elo",
                            :attachable_id => 1,
                            :attachable_type => "Project"


    assert_equal 1, Project.find(1).comments.count

  #check destroy comment
    post "/comment/destroy", :id => Project.find(1).comments.first.id
    assert_equal 0, Project.find(1).comments.count
  end

end
