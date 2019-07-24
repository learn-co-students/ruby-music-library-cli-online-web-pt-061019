class Genre
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
   Genre.new(name).save
   self
  end
  
  def artists
    self.songs.map{|song| song.artist}.uniq
    end
end