require 'test_helper'

class CommentControllerTest < ActionController::TestCase

  def test_create_action
    assert_difference('Comment.count') do
      post :create, {:text            => "bla",
                     :designer_id     => 1,
                     :attachable_id   => 1,
                     :attachable_type => "Portfolio" }
    end
  end


  def test_destroy_action
    assert_difference('Comment.count') do
      post :destroy, {:id => 1}
    end
  end

end
