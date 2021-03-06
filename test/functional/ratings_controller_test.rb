require 'test_helper'

class RatingsControllerTest < ActionController::TestCase

  def test_create_action
    session[:user_id] = 1
    assert_difference('Rating.count') do
      post :create, {:project_id => 1, :value => 3}
    end
    assert_redirected_to project_path(1)
  end

  def test_update_designer_score_after_create
    session[:user_id] = 1
    post :create, {:project_id => 1, :value => 4}
    assert_not_equal 1.2, designers(:aaa).score #was 1.2 before add 4(look fixtures)
  end

  def test_update_project_score
    session[:user_id] = 2
    assert_difference('Project.find(1).score', -1) do
      post :update, {:project_id => 1, :value => 3}
    end
  end

  def test_helper_function_current_designer_rating
  end

  def test_update_rating
    session[:user_id] = 2
    start_rating = Rating.find(:first, :conditions => {:project_id => 1, 
                                                       :designer_id => 2}
                              ).value

    post :update, {:project_id => 1, :value => 2}

    assert_not_equal start_rating, Rating.find(:first, :conditions => {
                                                          :project_id => 1, 
                                                          :designer_id => 2
                                                                       }).value
  end

end
