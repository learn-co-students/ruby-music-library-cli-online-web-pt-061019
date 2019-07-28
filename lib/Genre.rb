class Genre 
    extend Concerns::Findable

    @@all = [] 
    attr_accessor :name 
    attr_reader :songs

    def initialize(name)
        @name = name 
        @genre = []
        @songs = []
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
        genre = Genre.new(name)
        genre.save 
        genre 
    end 

    def songs
        @songs 
    end 

    def artists 
        self.songs.collect {|a| a.artist}.uniq
    end
end 