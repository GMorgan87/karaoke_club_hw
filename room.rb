class Room

  attr_reader :name, :capacity, :price, :songs

  def initialize(name, capacity, price)
    @name = name
    @capacity = capacity
    @price = price
    @songs = []
    @occupents = []
  end

  def get_songs
    return @songs
  end

  def get_occupents
    return @occupents
  end

  def add_song(song)
    @songs.push(song)
  end

  def add_guest(guest)
    @occupents.push(guest)
  end

  def remove_guest(guest)
    @occupents.delete(guest)
  end

end
