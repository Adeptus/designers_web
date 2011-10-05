require 'test_helper'

class PortfoliosControllerTest < ActionController::TestCase

  def test_get_index_correct
    get :index
    assert_response :success
  end
end
