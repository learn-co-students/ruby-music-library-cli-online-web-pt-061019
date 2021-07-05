require_relative '../lib/concerns/findable'
require 'pry'

class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs, :artist

  @@all = []

  def initialize(name)
    @name = name
    # self.save
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

  def self.create(genre_name)
    genre = self.new(genre_name)
    genre.save
    genre
  end

  def add_song(song)
    # binding.pry
    song.genre = self unless song.genre == self
    songs << song unless songs.include?(song)
  end

  def artists
    #has many artists through songs
    songs.map{|song_new| song_new.artist}.uniq
  end

end
