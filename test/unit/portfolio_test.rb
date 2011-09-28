require 'test_helper'

class PortfolioTest < ActiveSupport::TestCase

  def test_check_average_from_ratings_for_portfolio
    portfolio = Portfolio.find(1)    
    assert_equal 3, portfolio.get_average_portfolio_ratings()
  end

  def test_check_average_ratings_to_portfolio_without_any_rating
    portfolio = Portfolio.find(2)    
    assert_equal 0.0, portfolio.get_average_portfolio_ratings()
  end


end
