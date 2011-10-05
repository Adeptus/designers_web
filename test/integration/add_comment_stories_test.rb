require 'test_helper'

class UserStoriesTest < ActionController::IntegrationTest
  fixtures :all

  def test_create_designer_login_add_portfolio_add_project_logout

    get "/designers"
    assert_response :success
    assert_template "index"    

    post "/login", :name => designers(:aaa).name,
                   :password => designers(:aaa).password


    get "/portfolios"
    assert_response :success
    assert_template "index"    

    assert_equal 0, Project.find(1).comments.count
    post_via_redirect "/comments/create", :add_comment => {
                             :text            => "elo",
                             :designer_id     => designers(:aaa).id,
                             :attachable_id   => 1,
                             :attachable_type => "Project"}


    assert_equal 1, Project.find(1).comments.count

  #check destroy comment
    post "/comments/destroy", :id => Project.find(1).comments.first.id
    assert_equal 0, Project.find(1).comments.count
  end
end
