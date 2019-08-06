require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name

    @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    Song.all << self
    self
  end

  def self.create(name)
    songs = Song.new(name)
    song.save
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def artist
    @artist
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def genre
    @genre
  end

  def self.find_by_name(name)

    @@all.detect do |song|

      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

end
