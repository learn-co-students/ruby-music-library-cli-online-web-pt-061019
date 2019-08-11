require_all 'lib/concerns'

class Genre

    extend Concerns::Findable

    @@all = []

    attr_accessor :name
    attr_reader :songs

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
        genre = Genre.new(name)
        genre.save
        genre
    end

    def add_song(song)
        if !song.genre
            song.genre = self
        end
        if !songs.include?(song)
            @songs << song
        end
    end

    def artists
        songs.map {|song| song.artist}.uniq
    end

end
