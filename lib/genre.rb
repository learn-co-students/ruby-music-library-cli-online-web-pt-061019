require_relative './findable.rb'

class Genre 
  
  extend Concerns::Findable
  
  attr_accessor :name, :artist, :songs 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all
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
    genre = self.new(name)
    genre.save
    genre
  end
  
  def artists 
    songs.collect {|song| song.artist}.uniq
  end
  
end