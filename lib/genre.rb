class Genre
    
    extend Concerns::Findable

    attr_accessor :name, :songs

    @@all = []

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

    def self.create(name)
        new_genre = self.new(name)
        new_genre.save
        new_genre
    end

    def save
        @@all << self
    end 

    def artists
        artist_list = []
        self.songs.each do |song|
            artist_list << song.artist
        end
        artist_list.uniq
    end

end