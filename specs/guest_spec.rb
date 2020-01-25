require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../song')

class TestGuest < Minitest::Test

  def setup

    @josh = Guest.new("Josh", 33, 50, "Wonderwal")
    @toby = Guest.new("Toby", 40, 55, "Bohemian Rhapsody")
    @cj = Guest.new("CJ", 35, 60, "The Jackal")
    @zoey = Guest.new("Zoey", 17, 30, "Dancing Queen")


    @wonderwall = Song.new("Wanderwall", "Oasis")

  end

  def test_get_name
    assert_equal("Josh", @josh.name)
  end

  def test_get_age
    assert_equal(40, @toby.age)
  end

  def test_get_cash
    assert_equal(60, @cj.cash)
  end

  def test_get_fav_song
    assert_equal("The Jackal", @cj.fav_song)
  end

  def test_decrease_cash
    @josh.pay(20)
    assert_equal(30, @josh.cash)
  end

  def test_cheer
    assert_equal("Whoo!, They have my favourite song The Jackal!", @cj.cheer)
  end

  def test_sing
    @josh.sing(@wonderwall)
    assert("Josh sang Wonderwall")
    assert_equal(1, @wonderwall.play_count)
  end

  def test_under_18?
    assert_equal(false, @josh.under_18?)
    assert_equal(true, @zoey.under_18?)
  end

end
