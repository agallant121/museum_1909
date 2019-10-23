require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'

class PatronTest < Minitest::Test

  def setup
    @bob = Patron.new("Bob", 20)
  end

  def test_it_exists
    sally = Patron.new("Sally", 20)
    assert_instance_of Patron, @bob
    assert_instance_of Patron, sally
  end

  def test_initialize
    assert_equal "Bob", @bob.name
    assert_equal 20, @bob.spending_money
  end

  def test_bob_has_interests
    assert_equal [], @bob.interests
  end

  def test_bob_can_add_interests
    @bob.add_interest("Dead Sea Scrolls")
    @bob.add_interest("Gems and Minerals")
    expected = ["Dead Sea Scrolls", "Gems and Minerals"]
    assert_equal expected, @bob.interests
  end

  def test_sally_can_add_interests
    sally = Patron.new("Sally", 20)

    sally.add_interest("IMAX")
    expected = ["IMAX"]
    assert_equal expected, sally.interests
  end
end
