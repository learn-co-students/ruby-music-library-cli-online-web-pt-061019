require_relative './concerns/findable.rb'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    new(name).tap{|s| s.save}
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.genre = self unless song.genre
    songs << song unless @songs.include?(song)
  end

  # self.songs.collect{|s| s.artist}.uniq
  def artists
    self.songs.collect{|s| s.artist}.uniq
  end

  # def songs
  #   @songs
  # end
end
