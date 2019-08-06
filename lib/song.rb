class Song

attr_accessor :name, :artist

@@all = []

def initialize(name, artist_object = nil, genre_object = nil)
  @name = name
  @artist = artist_object
  @genre = genre_object
end

def self.all
  @@all
end

def self.destroy_all
  @@all.clear
end

def save
  @@all << self
end

def self.create(song)
  song = Song.new(song)
  song.save
  song
end

#def artist=(artist)
#  artist.songs << self
#end

def self.find_by_name(song)
  @@all.find {|object| object.name == song}
end

def self.find_or_create_by_name(song)

end
end
end
