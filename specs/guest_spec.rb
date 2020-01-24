require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')

class TestGuest < Minitest::Test

  def setup

    @josh = Guest.new("Josh", 33, 50, "Wonderwal")
    @toby = Guest.new("Toby", 40, 55, "Bohemian Rhapsody")
    @cj = Guest.new ("CJ", 35, 60, "The Jackal")

  end

  def test_get_name
    assert_equal("Josh", @josh.name)
  end

  def test_get_age
    assert_equal(30, @toby.age)
  end

  def test_get_cash
    assert_equal(60, @cj.cash)
  end

  def test_get_favourite_song
    assert_equal(@the_jackal, @cj.favourite_song)
  end

  def test_decrease_cash
    @josh.pay(20)
    assert_equal(30, @josh.cash)
  end

  end

end
