class Artist
  @@all = []
  attr_accessor :name, :songs
  def initialize(name)
    @name = name
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
   Artist.new(name).save
   self
  end
  
  def add_song(song)
   song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end
end