class Artist
  attr_accessor :name, :song, :musiclibrarycontroller, :musicimporter
  @@all = []
  extend Concerns::Findable
  
  def initialize (name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
    else
      nil
    end
    if @songs.include?(song)
      nil
    else
      @songs << song
    end
    song

  end
  
  def genres
    @artist_genres = []
    @songs.each do |song|
      if @artist_genres.include?(song.genre)
        nil
      else
        @artist_genres << song.genre
      end
    end
    @artist_genres
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
  
  def save
    @@all << self
  end

end