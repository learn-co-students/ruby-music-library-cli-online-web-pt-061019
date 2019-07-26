require 'pry'
class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name, artist=nil)
        @name = name
        @artist = artist
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