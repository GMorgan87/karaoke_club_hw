class Club

  attr_reader :name, :till

  def initialize(name, rooms, till)
    @name = name
    @rooms = rooms
    @till = till
  end

  def get_rooms
    return @rooms
  end

end
