require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'

class MuseumTest < Minitest::Test

  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
  end

  def test_it_exists
    assert_instance_of Museum, @dmns
  end

  def test_it_has_a_name
    assert_equal "Denver Museum of Nature and Science", @dmns.name
  end

  def test_it_has_exhibits
    assert_equal [], @dmns.exhibits
  end

  def test_it_has_new_exhibits
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)
    @dmns.add_exhibit(gems_and_minerals)
    @dmns.add_exhibit(dead_sea_scrolls)
    @dmns.add_exhibit(imax)
    expected = [gems_and_minerals, dead_sea_scrolls, imax]
    assert_equal expected, @dmns.exhibits
  end

  def test_it_can_recommend_exhibits
    @dmns = Museum.new("Denver Museum of Nature and Science")
    bob = Patron.new("Bob", 20)
    sally = Patron.new("Sally", 20)
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)
    @dmns.add_exhibit(gems_and_minerals)
    @dmns.add_exhibit(dead_sea_scrolls)
    @dmns.add_exhibit(imax)
    sally.add_interest("IMAX")
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Gems and Minerals")

    expected = [gems_and_minerals, dead_sea_scrolls]
    expected_2 = [imax]
    assert_equal expected, @dmns.recommend_exhibits(bob)
    assert_equal expected_2, @dmns.recommend_exhibits(sally)
  end

  def test_it_has_patrons
    # bob = Patron.new("Bob", 20)
    # sally = Patron.new("Sally", 20)
    # bob.add_interest("Dead Sea Scrolls")
    # sally.add_interest("Dead Sea Scrolls")
    assert_equal [], @dmns.patrons
  end
end
