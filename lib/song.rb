require 'pry'
class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name, artist = nil, genre = nil)
      new(name, artist, genre).tap{|s| s.save}
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    @@all.detect{|s|s.name == name}
  end

  def self.find_or_create_by_name(name)
    # binding.pry
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    songname = filename.split(" - ")[1]
    # song = self.new(songname)

    artistname = filename.split(" - ")[0]
    genrename = filename.split(" - ")[2].split(".")[0]
    # genre_name = genrename.split(".")[0]


    new_artist = Artist.new(artistname)

    new_genre = Genre.new(genrename)
    song = self.new(songname, new_artist , new_genre)
    # song = self.new(songname)
    # song.artist = new_artist
    # song.genre = new_genre
    # if (song.artist.nil?)
    #   new_artist = Artist.new(artistname)
    #   new_genre = Genre.new(genrename)
    #   song.artist = new_artist
    #   new_artist.songs << song
    #   new_artist.save
    # else
    #   song.artist.name = artistname
    #   song.genre.name = genrename
    # end

    # @@all << song
    song
      # binding.pry
  end

  def create_from_filename

  end

end
