require 'test_helper'

class DesignerTest < ActiveSupport::TestCase

  def test_invalid_without_athributes
    designer =  Designer.new
    assert !designer.valid?
    assert designer.errors.invalid?(:name)
    assert designer.errors.invalid?(:tel)
    assert designer.errors.invalid?(:image_url)
    assert designer.errors.invalid?(:presentation)
  end

  def test_with_correct_athributs
    designer =  Designer.new(:name         => "Koza2",
                             :tel          => 2222,
                             :image_url    => "image.gif",
                             :presentation => "lalalalala")
    assert designer.valid?
  end

  def test_athribut_tel_number
    designer =  Designer.new(:name         => "Koza",
                             :tel          => "AAA",
                             :image_url    => "image.gif",
                             :presentation => "lalalalala")
    assert !designer.valid?
  end


  def test_unique_designer
    designer = Designer.new(:name         => designers(:aaa).name,
                            :tel          => "AAA",
                            :image_url    => "image.gif",
                            :presentation => "lalalalala")
    assert !designer.save
    assert_match /already exist/, designer.errors.on(:name)
  end
  
end
