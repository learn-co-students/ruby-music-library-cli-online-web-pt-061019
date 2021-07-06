require_relative '../lib/concerns/findable'
require 'pry'

class Artist 
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs 
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    # self.save
  end
  
  def self.all 
    @@all
  end
  
  def self.destroy_all  
    self.all.clear
  end
  
  def save 
    self.class.all << self 
  end
  
  def self.create(name) 
    artist = Artist.new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    song.artist = self if song.artist == nil
    self.songs << song if !self.songs.include?(song)
  end
  
  def genres 
    self.songs.map {|song| song.genre}.uniq
  end
end