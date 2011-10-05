require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  def test_create_action
    assert_difference('Comment.count') do
      post :create, :add_comment => {:text            => "bla",
                                     :designer_id     => 1,
                                     :attachable_id   => 1,
                                     :attachable_type => "Portfolio" }
    end
  end


  def test_destroy_action
    assert_difference('Comment.count', -1) do
      post :destroy, :id => 1
    end
  end
end
