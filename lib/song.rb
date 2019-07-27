class Song
  attr_accessor :name
  attr_reader :artist, :genre

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
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(song_name)
    song = self.new(song_name)
    song.save
    song
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
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
    details = filename.split(" - ")
    song = self.new(details[1])
    artist = Artist.find_or_create_by_name(details[0])
    genre = Genre.find_or_create_by_name(details[2].gsub(".mp3", ""))
    song.artist = artist
    song.genre = genre
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
end
    # details = name.chomp(".mp3").split(" - ")
    # artist = Artist.find_or_create_by_name(artist)
    # genre = Genre.find_or_create_by_name(genre)
    # new(details)
