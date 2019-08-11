require_all 'lib/concerns'

class Artist
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

    # def self.find_by_name(name)
    #   @@all.detect {|a| a.name == name}
    # end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        artist = Artist.new(name)
        artist.save
        artist
    end

    def add_song(song)
        if !song.artist
            song.artist = self
        end
        if !songs.include?(song)
            @songs << song
        end
    end

    def genres
        @songs.map {|song| song.genre}.uniq
    end
end
