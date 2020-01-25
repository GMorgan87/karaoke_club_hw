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

    @josh = Guest.new("Josh", 33, 50, "wonderwall")
    @toby = Guest.new("Toby", 40, 55, "bohemian_rhapsody")
    @cj = Guest.new("CJ", 35, 60, "the_jackal")
    @zoey = Guest.new("Zoey", 17, 30, "dancing_queen")
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
    @wonderwall = Song.new("Wanderwall", "Oasis")
    @ccc.add_song_to_room(@room101,@wonderwall)
    assert_equal([@wonderwall], @room101.get_songs())
  end

  def test_check_in__individual
    @ccc.check_in(@josh, @room101)
    assert_equal([@josh],@room101.get_occupents)
  end

  def test_check_in__group
    @ccc.check_in(@guests, @room101)
    assert_equal([@josh, @toby, @cj, @zoey],@room101.get_occupents)
  end

  def test_check_out___individual
    @ccc.check_in(@guests, @room101)
    @ccc.check_out(@zoey, @room101)
    assert_equal([@josh, @toby, @cj],@room101.get_occupents)
  end

  def test_check_out___group
    @ccc.check_in(@guests, @room101)
    @ccc.check_out([@toby,@zoey], @room101)
    assert_equal([@josh,@cj],@room101.get_occupents)
  end



end
