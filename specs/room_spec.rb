require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRoom < Minitest::Test

  def setup

    @bohemian_rhapsody = Song.new("Bohemian Rhapsody", "Queen")
    @wonderwall = Song.new("Wanderwall", "Oasis")
    @africa = Song.new("Africa", "Toto")
    @dancing_queen = Song.new("Dancing Queen", "Abba")
    @the_jackal = Song.new("The Jackal", "Unknown")
    @songs = [@bohemian_rhapsody, @wonderwall, @africa, @dancing_queen, @the_jackal]

    @josh = Guest.new("Josh", 33, 50, "wonderwall")
    @toby = Guest.new("Toby", 40, 55, "bohemian_rhapsody")
    @cj = Guest.new("CJ", 35, 60, "the_jackal")
    @zoey = Guest.new("Zoey", 17, 30, "dancing_queen")
    @guests = [@josh, @toby, @cj, @zoey]

    @room101 = Room.new("Room 101", 4, 5, @songs)

  end

  def test_get_name
    assert_equal("Room 101", @room101.name)
  end

  def test_get_capacity
    assert_equal(4, @room101.capacity)
  end

  def test_get_price
    assert_equal(5, @room101.price)
  end

  def test_get_songs
    assert_equal([@bohemian_rhapsody, @wonderwall, @africa, @dancing_queen, @the_jackal], @room101.songs)

  end

  def test_get_occupents
    assert_equal([], @room101.get_occupents)
  end



end
