class Genre
  attr_accessor :name, :musiclibrarycontroller, :musicimporter
  @@all = []
  extend Concerns::Findable
  
  def initialize (name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end
  
  def save
    @@all << self
  end
  
  def artists
    @genre_artists = []
    @songs.each do |song|
      if @genre_artists.include?(song.artist)
        nil
      else
        @genre_artists << song.artist
      end
    end
    @genre_artists
  end
  
  def songs
    @songs
  end
end