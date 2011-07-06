require 'test_helper'

class PortfolioTest < ActiveSupport::TestCase

  def test_invalid_without_athributes
    portfolio =  Portfolio.new
    assert !portfolio.valid?
    assert portfolio.errors.invalid?(:designer_id)
  end

  def test_with_athributes
    portfolio =  Portfolio.new(:designer_id => 112)
    assert portfolio.valid?
  end

  def test_with_wrong_athribute
    portfolio =  Portfolio.new(:designer_id => "a")
    assert !portfolio.valid?
  end

  def test_unique_portfolio
    portfolio = Portfolio.new(:designer_id  => portfolios(:one).designer_id)
    assert !portfolio.save
    assert portfolio.errors.invalid?(:designer_id)
  end
end
