class Song

attr_accessor :name, :artist, :genre

@@all = []

def initialize(name, artist_object = nil, genre_object = nil)
  @name = name
  if artist_object != nil
    self.artist = artist_object
  end
  if genre_object != nil
    self.genre = genre_object
  end
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

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def self.find_by_name(song)
  @@all.find {|object| object.name == song}
end

def genre=(genre)
  @genre = genre
  genre.songs << self unless genre.songs.include?(self)
end

def self.find_or_create_by_name(song)
  if self.find_by_name(song) == nil
    self.create(song)
  else
    self.find_by_name(song)
  end
end


def self.new_from_filename(file_name)
  array = file_name.split(" - ")
    song_artist = array[0]
    song_name = array[1]
    song_genre = array[2].split(".mp3")[0]
  new_song_instance = Song.find_or_create_by_name(song_name)
  new_artist_instance = Artist.find_or_create_by_name(song_artist)
  new_genre_instance = Genre.find_or_create_by_name(song_genre)
  new_song_instance.artist = new_artist_instance
  new_song_instance.genre = new_genre_instance
  new_song_instance
  end

def self.create_from_filename(file_name)
  self.new_from_filename(file_name)
end

end
