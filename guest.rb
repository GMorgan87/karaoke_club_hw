class Guest

attr_reader :name, :age, :cash, :fav_song

def initialize(name, age, cash, fav_song)
  @name = name
  @age = age
  @cash = cash
  @fav_song = fav_song
end

def pay(amount)
  @cash -= amount
end

def cheer
  p "Whoo!, They have my favourite song #{fav_song}!"
end

def sing(song)
  song.play()
  puts "#{name} sang #{song.name}"
end

end
