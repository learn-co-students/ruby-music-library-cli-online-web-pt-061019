require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist #song belongs to artist
    self.genre = genre if genre
    self.save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    # @@all.clear
    self.all.clear
  end

  def save
    # @@all << self
    self.class.all << self
  end

  def self.create(song_title)
    # binding.pry
    song = self.new(song_title)
    song.save
    song
    #@@all
  end

  def artist=(artist) #assigns an artist to the song
    @artist = artist
    # artist.song(self)
    # binding.pry
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    # binding.pry
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
  # binding.pry

  # find_by_name(name) != nil ? find_by_name(name) : create(name)

  # if find_by_name(name) == nil
  #   find_by_name(name)
  # else
  #   create(name)
  # end
  # name == song.name ? find_by_name(name) : create(name)



end
