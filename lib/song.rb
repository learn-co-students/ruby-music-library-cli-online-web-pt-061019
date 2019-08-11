

class Song

    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist
        self.genre = genre

    end

    def artist=(artist)
        @artist = artist
        if artist
            artist.add_song(self)
        end
    end

    def genre=(genre)
        @genre = genre
        if genre
            genre.add_song(self)
        end
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
        song = Song.new(name)
        song.save
        song
    end

    def self.find_by_name(name)
        @@all.detect {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        song = Song.find_by_name(name)
        if !song
            song = Song.create(name)
        end
        song
    end
end
