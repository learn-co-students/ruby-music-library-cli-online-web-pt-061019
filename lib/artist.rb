require_relative './concerns/findable.rb'
require 'pry'


class Artist
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
    self.all.clear   #as same as @@all.clear
  end

  def self.create(name)
    new(name).tap{|s| s.save}
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.collect{|s| s.genre}.uniq
    # binding.pry
  end

end
