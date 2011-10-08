require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

  def test_cant_vout_your_project
    post :login, :name => designers(:aaa).name, :password => designers(:aaa).password
    get :show, :id => 1
    assert_response :success
    assert_select "div#ratings_form", 0
  end

  def test_can_vout_others_project
    post :login, :name => designers(:aaa).name, :password => designers(:aaa).password
    get :show, :id => 3
    assert_response :success
    assert_select "div#ratings_form", 1
  end
end
