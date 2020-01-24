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

end
