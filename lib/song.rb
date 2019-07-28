require 'pry'
class Song

    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end

    def self.all
        @@all
    end
    
    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        new_song = self.new(name)
        new_song.save
        new_song
    end

    def save
        @@all << self
    end

    def self.find_by_name(name)
        self.all.find {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        find_by_name(name) || create(name)
    end

    def self.new_from_filename(filename)
        name = filename.split(" - ")[1]
        
        artist_name = filename.split(" - ")[0]
        artist = Artist.find_or_create_by_name(artist_name)
        
        genre_name = filename.split(" - ")[2].gsub(".mp3", "")
        genre = Genre.find_or_create_by_name(genre_name)
        
        new_song = self.new(name, artist, genre)

        new_song
    end

    def self.create_from_filename(filename)
        new_song = new_from_filename(filename)
        new_song.save
    end

end