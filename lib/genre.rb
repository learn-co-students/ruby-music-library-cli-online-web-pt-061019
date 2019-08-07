class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    # @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    Genre.all << self
    self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
  end

  def songs
    @songs
  end

  def artists
    songs.map {|song| song.artist}.uniq
  end
end
