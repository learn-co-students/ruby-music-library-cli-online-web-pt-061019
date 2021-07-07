

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

    def self.new_from_filename(file_name)
        pieces = file_name.split(" - ")
        artist_name = pieces[0].strip
        song_name = pieces[1].strip
        genre_name = pieces[2].split(".").first.strip

        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)

        Song.new(song_name, artist, genre)
    end

    def self.create_from_filename(file_name)
        song = Song.new_from_filename(file_name)
        song.save
        song
    end


end
