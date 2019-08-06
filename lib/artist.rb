class Artist

  attr_accessor :name, :artist, :genres
  @@all = []
  def initialize(name)
    @name = name
    @artist = artist
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    Artist.all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.name = self
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    self.songs.map {|song| song.genre}.uniq
  end
end
