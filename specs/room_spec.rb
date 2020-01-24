require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')

class TestRoom < Minitest::Test

  def setup

    @bohemian_rhapsody = Song.new("Bohemian Rhapsody", "Queen", 0)
    @wonderwall = Song.new("Wanderwall", "Oasis", 0)
    @africa = Song.new("Africa", "Toto" 0)
    @dancing_queen = Song.new("Dancing Queen", "Abba", 0)
    @the_jackal = Song.new("The Jackal", "Unknown", 0)
    @songs = [@bohemian_rhapsody, @wonderwall, @africa, @dancing_queen, @the_jackal]

    @josh = Guest.new("Josh", 33, 50, @wonderwall)
    @toby = Guest.new("Toby", 40, 55, @bohemian_rhapsody)
    @cj = Guest.new ("CJ", 35, 60, @the_jackal)
    @zoey = Guest.new ("Zoey", 17, 30, @dancing_queen)
    @guests = [@josh, @toby, @cj, @zoey]

  end

end
