require 'test_helper'

class DesignersControllerTest < ActionController::TestCase

  def test_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:designers)
  end

  def test_add_action
    get :new
    assert_response :success
  end

  def test_create_action
    assert_difference('Designer.count') do
      post :create, :designer => {:name         => "bla",
                                  :password     => "aaaa",
                                  :tel          => 1111,
                                  :image_url    => "llalala",
                                  :presentation => "sadsdsa" }
    end

    assert_redirected_to :action => "index"
  end

  def test_destroy_action
    assert_difference('Designer.count', -1) do
      post :destroy, :id => designers(:aaa).to_param
    end
    assert_redirected_to :action => "index"
  end
end
