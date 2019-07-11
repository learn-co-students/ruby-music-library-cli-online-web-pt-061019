require 'pry'
class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name, artist = nil, genre = nil)
      new(name, artist, genre).tap{|s| s.save}
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    @@all.detect{|s|s.name == name}
  end

  def self.find_or_create_by_name(name)
    # binding.pry
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    songname = filename.split(" - ")[1]
    artistname = filename.split(" - ")[0]
    genrename = filename.split(" - ")[2].split(".")[0]
    new_artist = Artist.find_or_create_by_name(artistname)
    new_genre = Genre.find_or_create_by_name(genrename)
    song = self.new(songname, new_artist , new_genre)
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end

end
