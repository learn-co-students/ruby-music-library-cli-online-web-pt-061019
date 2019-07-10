require 'pry'

class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    artist = Artist.new(name)
    artist.save
    artist
  end

  #spec 004
  def add_song(song)
    song.artist == nil ? song.artist = self : song.artist
    @songs.include?(song) ? song : @songs << song
  end

end
