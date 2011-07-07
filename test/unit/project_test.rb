require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def test_invalid_without_athributes
    project =  Project.new
    assert !project.valid?
    assert project.errors.invalid?(:portfolio_id)
  end

  def test_with_athributes
    project =  Project.new(:portfolio_id => 11)
    assert project.valid?
  end
end
