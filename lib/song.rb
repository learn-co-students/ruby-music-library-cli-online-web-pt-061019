class Song

  attr_accessor :name
  @@all = []

  def initialize(name, artist=nil)
    @name = name
    @artist = artist if artist
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
    song = Song.new(name)
    song.save
    song
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    Artist.add_song(self)
  end



end
