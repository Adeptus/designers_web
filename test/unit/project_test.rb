require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def test_search_without_searching_text
    assert_equal 3, Project.search("", 1, "text", "asc").size
  end

  def test_search_one
    assert_equal "Kowalstwo Artystyczne", Project.search("Kowalstwo", 1, "text", "asc").first.text
  end

  def test_serach_order_default
    assert_equal "MyString", Project.search("", 1, "text", "asc").last.text
  end

  def test_serach_order_special_walue
    assert_match /Editor/, Project.search("", 1, "score", "desc").first.text
  end

  def test_average_rating
    assert_equal 4.0, Project.find(:first).average_rating
  end
end
