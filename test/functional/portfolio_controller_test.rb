require 'test_helper'

class PortfolioControllerTest < ActionController::TestCase

  def test_get_index_correct
    get :index, :id => 1
    assert_response :success
    assert_not_nil assigns(:designer)
  end
end
