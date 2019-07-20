require 'pry'
require_relative '../lib/concerns/findable'

class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs, :genre

  @@all =[]

  def initialize(name)
    @name = name
    # self.save
    @songs = [] #artist has many songs
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

  def self.create(artist_name)
    artist = self.new(artist_name)
    artist.save
    artist
  end

  def add_song(song) #song belongs to artist
    # binding.pry
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def genres
  #has many genres through songs
    songs.map{|song_new| song_new.genre}.uniq
  end

end
