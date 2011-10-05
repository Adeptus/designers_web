require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase

  def test_login_correct
    post :login, :name => designers(:aaa).name, :password => designers(:aaa).password
    assert_equal designers(:aaa).id, session[:user_id]
  end

  def test_login_bed_password
    post :login, :name => designers(:aaa).name, :password => "ass"
    assert_not_equal designers(:aaa).id, session[:user_id]
  end

  def test_logout
    session[:user_id] = designers(:aaa).id
    assert_equal designers(:aaa).id, session[:user_id]

    post :logout, :id => designers(:aaa).id
    assert_nil session[:user_id]
  end

  def test_set_news
    post :set_news, :set_news => {:news => "projects"}
    assert_equal projects(:one).id, session[:news].first.id
  end
end
