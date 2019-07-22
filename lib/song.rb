require 'pry'

class Song

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :genre, :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist= artist
    end
    if genre != nil
      self.genre= genre
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

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  #spec 004
  def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end

  #spec 005
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  #spec 007
  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end


  #spec
  def self.new_from_filename(filename)
    name = filename.split(" - ")[1]
    song = self.create(name)
    this_artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    song.artist = this_artist
    # this_artist.add_song(song)
    this_genre = Genre.find_or_create_by_name(filename.split(" - ")[2].gsub(".mp3", ""))
    song.genre = this_genre
    # this_genre.add_song(song)
    # binding.pry
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end


end
