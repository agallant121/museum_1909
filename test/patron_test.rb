require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'

class PatronTest < Minitest::Test

  def setup
    @bob = Patron.new("Bob", 20)
  end

  def test_it_exists
    assert_instance_of Patron, @bob
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
end
