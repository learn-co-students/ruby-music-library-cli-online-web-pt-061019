class Artist

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    song = Artist.new(name)
    song.save
    song
  end

  def songs
    Song.all
  end

  def add_song(song)
    song.artist = self unless song.artist != nil
    song.save unless Song.all.include? song
  end

end
