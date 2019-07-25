require_relative '../lib/concerns/findable'
require 'pry'

class Song 
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre 
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    (song = self.new(name)).save
    song
  end
  
  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self) 
  end
  
  def self.find_by_name(name) 
    self.all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
    #Thundercat - For Love I Come - dance.mp3
    
    artist, title, genre = filename.split(/\s-\s|\./)
    binding.pry
    self.new(title).tap {|song|
      song.artist = Artist.find_or_create_by_name(artist)
      song.genre = Genre.find_or_create_by_name(genre)
    }
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end