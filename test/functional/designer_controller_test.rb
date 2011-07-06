require 'test_helper'

class DesignerControllerTest < ActionController::TestCase

  def test_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:designers)
  end

  def test_add_action
    get :add
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

  def test_login_correct
    post :login, :name => designers(:aaa).name, :password => designers(:aaa).password
    assert_redirected_to :action => "index"
    assert_equal designers(:aaa).id, session[:user_id]
  end

  def test_login_bed_password
    post :login, :name => designers(:aaa).name, :password => "ass"
    assert_not_equal designers(:aaa).id, session[:user_id]
    assert_redirected_to :action => "index"
  end

  def test_logout
    session[:user_id] = designers(:aaa).id
    assert_equal designers(:aaa).id, session[:user_id]

    post :logout, :id => designers(:aaa).id
    assert_nil session[:user_id]
    assert_redirected_to :action => "index"
  end

end
