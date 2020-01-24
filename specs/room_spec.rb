require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')

class TestRoom < Minitest::Test

  def setup

    @bohemian_rhapsody = Song.new("Bohemian Rhapsody", "Queen", 0)
    @wannabe = Song.new("Wannabe", "Spice Girls", 0)
    @wonderwall = Song.new ("Wanderwall", "Oasis", 0)
    @angels = Song.new ("Angels", "Robbie Williams", 0)
    @africa = Song.new ("Africa", "Toto" 0)
    @dancing_queen = Song.new ("Dancing Queen", "Abba", 0)
    @country_house = SOng.new ("Country House", "Blur", 0)
    @songs = [@bohemian_rhapsody, @wannabe, @wonderwall, @angels, @africa, @dancing_queen, @country_house]

  end

end
