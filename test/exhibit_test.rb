require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'

class ExhibitTest < Minitest::Test

  def setup
    @exhibit = Exhibit.new("Gems and Minerals", 0)
  end

  def test_it_exists
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)
    assert_instance_of Exhibit, @exhibit
    assert_instance_of Exhibit, dead_sea_scrolls
    assert_instance_of Exhibit, imax

  end

  def test_initialize
    assert_equal "Gems and Minerals", @exhibit.name
    assert_equal 0, @exhibit.cost
  end
end
