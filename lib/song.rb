require 'pry'
class Song
    attr_accessor :name, :genre
    attr_reader :artist

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

end