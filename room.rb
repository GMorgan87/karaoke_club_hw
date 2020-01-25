class Room

  attr_reader :name, :capacity, :price
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

  def has_fav_song(guest)
    @songs.each do |song|
      if song.name == guest.fav_song
        return true
      end
    end
    return false
  end

  def add_guest(guest)
    @occupents.push(guest)
    if has_fav_song(guest)
      guest.cheer
    end
  end


  def remove_guest(guest)
    @occupents.delete(guest)
  end



end
