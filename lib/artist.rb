require_relative 'concerns/findable.rb'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    created_artist = Artist.new(name)
    created_artist.save
    created_artist
  end

  def add_song(song)
    if self.songs.include?(song) == false
      @songs << song
      song.artist = self if song.artist == nil
    end
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end

end
