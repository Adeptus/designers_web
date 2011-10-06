require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def test_search_without_searching_text
    assert_equal 3, Project.search("", 1).size
  end

  def test_search_one
    assert_equal "Kowalstwo Artystyczne", Project.search("Kowalstwo", 1).first.text
  end

  def test_average_rating
    assert_equal 4.0, Project.find(:first).average_rating
  end

end
