class Song
  attr_accessor :name, :artist, :genre, :musicimporter, :musiclibrarycontroller
  @@all = []
  extend Concerns::Findable
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
  end
  
  # def self.find_by_name(name)
  #   @@all.detect do |song|
  #     song.name == name
  #   end
  # end
  
  # def self.find_or_create_by_name(name)
  #   # Song.all.each do |song|
  #   #   if name == song
  #   #     song
  #   #   else 
  #   #     Song.create(name)
  #   #   end
  #   # end
  #   self.find_by_name(name) || self.create(name)
  # end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
  
  def save
    @@all << self
  end
  
  def self.new_from_filename(file)
    song = file.split(" - ")

    song_name = song[1]
    artist_name = song[0]
    genre_name = song[2].split(".mp3").join

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end
end