require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')

class TestSong < Minitest::Test

  def setup
    @wannabe = Song.new("Wannabe", "Spice Girls")
    @wonderwall = Song.new("Wonderwall", "Oasis")
    @angels = Song.new("Angels", "Robbie Williams")
    @africa = Song.new("Africa", "Toto")
    @country_house = Song.new("Country House", "Blur")
  end

  def test_get_name
    assert_equal("Wonderwall", @wonderwall.name)
  end

  def test_get_artist
    assert_equal("Blur", @country_house.artist)
  end

  def test_play_count
    assert_equal(0, @africa.play_count)
  end

  def test_increase_play_count
    assert_equal(1, @wonderwall.play())
  end


end
