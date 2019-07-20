require 'pry'
require_relative '../lib/concerns/findable'

class Song
  # extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    self.artist = artist if artist #song belongs to artist
    self.genre = genre if genre
    # self.save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    # @@all.clear
    self.all.clear
  end

  def save
    # @@all << self
    self.class.all << self
  end

  def self.create(name)
    # binding.pry
    song = self.new(name)
    song.save
    song
    #@@all
  end

  def artist=(artist) #assigns an artist to the song
    @artist = artist
    # artist.song(self)
    # binding.pry
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    # binding.pry
    self.all.find{ |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    # binding.pry
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(name)
    # binding.pry
    artist, song, genre = name.chomp(".mp3").split(" - ")
    #.gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    new(song, artist, genre)
  end

  def self.create_from_filename(name)
    new_from_filename(name).save
  end

end
