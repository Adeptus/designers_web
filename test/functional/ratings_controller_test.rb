require 'test_helper'

class RatingsControllerTest < ActionController::TestCase

  def test_create_action
    assert_difference('Rating.count') do
      post :create, {:project_id => 1, :rating => 3, :designer_id => 1}
    end
    assert_redirected_to project_path(1)
  end

  def test_update_designer_score_after_create
    post :create, {:project_id => 1, :rating => 4, :designer_id => 1}
    assert_not_equal 1.2, designers(:aaa).score #was 1.2 after add new(look fixtures)
  end

  def test_update_action

  end

end
