require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../club')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestClub < Minitest::Test

  def setup

    @room101 = Room.new("Room 101", 4, 5)
    @room102 = Room.new("Room 102", 5, 5)
    @rooms = [@room101, @room102]

    @wonderwall = Song.new("Wonderwall", "Oasis")
    @the_jackal = Song.new("The Jackal", "Unknown")


    @josh = Guest.new("Josh", 33, 50, "Wonderwall")
    @toby = Guest.new("Toby", 40, 55, "Bohemian Rhapsody")
    @cj = Guest.new("CJ", 35, 60, "The Jackal")
    @zoey = Guest.new("Zoey", 17, 30, "Dancing Queen")
    @guests = [@josh, @toby, @cj, @zoey]

    @ccc = Club.new("CodeClanCaraoke", @rooms, 200)

  end

  def test_get_name
    assert_equal("CodeClanCaraoke", @ccc.name)
  end

  def test_get_rooms
    assert_equal([@room101, @room102], @ccc.get_rooms)
  end

  def test_get_till
    assert_equal(200, @ccc.till)
  end

  def test_add_song_to_room
    @ccc.add_song_to_room(@room101,@wonderwall)
    assert_equal([@wonderwall], @room101.get_songs())
  end

  def test_check_in
    @ccc.add_song_to_room(@room101,@wonderwall)
    @ccc.check_in(@josh, @room101)
    assert_equal([@josh],@room101.get_occupents)
    assert_equal(45, @josh.cash)
    assert_equal(205, @ccc.till)
  end

  def test_check_in_group
    @ccc.add_song_to_room(@room101,@wonderwall)
    @ccc.add_song_to_room(@room101,@the_jackal)
    @ccc.check_in_group(@guests, @room101)
    assert_equal([@josh, @toby, @cj],@room101.get_occupents)
    assert_equal(45, @josh.cash)
    assert_equal(50, @toby.cash)
    assert_equal(215, @ccc.till)
  end

  def test_check_in_group__room_full
    @ccc.check_in_group(@guests, @room101)
    @leo = Guest.new("Leo", 60, 100, "My Way")
    @bartlet = Guest.new("Bartlet", 60, 100, " ")
    @ccc.check_in(@leo, @room101)
    @ccc.check_in(@bartlet, @room101)
    assert_equal([@josh, @toby, @cj,@leo],@room101.get_occupents)
    assert_equal(220, @ccc.till)
  end

  def test_check_out___individual
    @ccc.check_in_group(@guests, @room101)
    @ccc.check_out(@zoey, @room101)
    assert_equal([@josh, @toby, @cj],@room101.get_occupents)
  end

  def test_check_out___group
    @ccc.check_in_group(@guests, @room101)
    @ccc.check_out([@toby,@zoey], @room101)
    assert_equal([@josh,@cj],@room101.get_occupents)
  end








end
