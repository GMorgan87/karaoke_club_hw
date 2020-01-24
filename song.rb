class Song

  attr_reader :name, :artist, :play_count

  def initialize(name, artist)
    @name = name
    @artist = artist
    @play_count = 0
  end

  def play
    @play_count += 1
  end

end
