require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRoom < Minitest::Test

  def setup

    @bohemian_rhapsody = Song.new("Bohemian Rhapsody", "Queen")
    @wonderwall = Song.new("Wonderwall", "Oasis")
    @africa = Song.new("Africa", "Toto")
    @dancing_queen = Song.new("Dancing Queen", "Abba")
    @the_jackal = Song.new("The Jackal", "Unknown")
    @songs = [@bohemian_rhapsody, @wonderwall, @africa, @dancing_queen, @the_jackal]

    @josh = Guest.new("Josh", 33, 50, "Wonderwall")
    @toby = Guest.new("Toby", 40, 55, "Bohemian_Rhapsody")
    @cj = Guest.new("CJ", 35, 60, "The Jackal")
    @zoey = Guest.new("Zoey", 17, 30, "Dancing Queen")
    @guests = [@josh, @toby, @cj, @zoey]

    @room101 = Room.new("Room 101", 4, 5)

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
    assert_equal([], @room101.get_songs)
  end

  def test_get_occupents
    assert_equal([], @room101.get_occupents)
  end

  def test_add_songs_to_room
    @room101.add_song(@wonderwall)
    @room101.add_song(@the_jackal)
    assert_equal([@wonderwall, @the_jackal], @room101.get_songs)
  end

  def test_add_guest
    @room101.add_guest(@josh)
    @room101.add_guest(@toby)
    assert_equal([@josh, @toby], @room101.get_occupents)
  end

  def test_remove_guest
    @room101.add_guest(@josh)
    @room101.add_guest(@toby)
    @room101.remove_guest(@josh)
    assert_equal([@toby], @room101.get_occupents)
  end

  def test_has_fav_song?
    @room101.add_song(@wonderwall)
    @room101.add_guest(@josh)
    assert_equal(true, @room101.has_fav_song(@josh))
  end

end
