class Room

  attr_reader :name, :capacity, :price, :songs

  def initialize(name, capacity, price, songs)
    @name = name
    @capacity = capacity
    @price = price
    @songs = songs
    @occupents = []
  end

  def get_occupents
    return @occupents
  end

end
