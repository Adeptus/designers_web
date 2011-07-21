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

end
