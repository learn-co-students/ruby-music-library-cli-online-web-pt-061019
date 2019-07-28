class Song 

    @@all = []
attr_accessor :name, :artist, :genre

    def initialize(name, artist = nil, genre = nil)
    @name = name 
    @songs = [] 
    self.artist = artist if artist
    @genre = genre  
    self.genre = genre if genre 
end 

def self.all
    @@all 
end 

def self.destroy_all
    self.all.clear 
end 

def save
    @@all << self 
end 

def self.create(name)
    song = Song.new(name)
    song.save
    song
end 

def artist=(artist)
    @artist = artist
    artist.add_song(self)
end 

def genre=(genre)
    @genre = genre 
    if !(genre.songs.include?(self))
        genre.songs << self 
    end 
end 

def self.find_by_name(name) 
    all.detect {|song| song.name == name}
end 

def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
end 

def self.new_from_filename(filename)
    file_piece = filename.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(file_piece[0])
    genre = Genre.find_or_create_by_name(file_piece[2])
    self.new(file_piece[1], artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end 
end 