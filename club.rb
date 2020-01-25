class Club
# require('pry')
  attr_reader :name, :till

  def initialize(name, rooms, till)
    @name = name
    @rooms = rooms
    @till = till
  end

  def get_rooms
    return @rooms
  end

  def add_song_to_room(room,song)
    room.add_song(song)
  end

  def check_in(guests, room)
    if guests.is_a?(Array)
      for guest in guests
        room.add_guest(guest)
      end
    else
      room.add_guest(guests)
    end
    # p room.get_occupents
  end

  def check_out(guests, room)
    if guests.is_a?(Array)
      for guest in guests
        room.remove_guest(guest)
      end
    else
      room.remove_guest(guests)
    end
    # p room.get_occupents
  end








end
