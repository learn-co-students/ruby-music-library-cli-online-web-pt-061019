require 'pry'

class MusicLibraryController

    # attr_reader :path

    def initialize(path = "./db/mp3s")
        # @path = path
        @importer = MusicImporter.new(path)
        @importer.import
    end

    def call
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"

        input = nil
        while input != "exit"
            input = gets

            case input
            when "list songs"
                self.list_songs
            when "list artists"
                self.list_artists
            when "list genres"
                self.list_genres
            when "list artist"
                self.list_songs_by_artist
            when "list genre"
                self.list_songs_by_genre
            when "play song"
                self.play_song
            end

        end

    end

    def list_songs
        songs = Song.all.sort_by {|song| song.name}
        index = 1
        songs.each do |song|
            puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            index += 1
        end
    end

    def list_artists
        artists = Artist.all.sort_by {|artist| artist.name}
        index = 1
        artists.each do |artist|
            puts "#{index}. #{artist.name}"
            index += 1
        end
    end

    def list_genres
        genres = Genre.all.sort_by {|genre| genre.name}
        genres.each_with_index do |genre, index|
            puts "#{index + 1}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist_name = gets
        artist = Artist.find_by_name(artist_name)
        songs = Song.all
            .select {|song| song.artist == artist}
            .sort_by {|song| song.name}
        songs.each_with_index do |song, index|
            puts "#{index + 1}. #{song.name} - #{song.genre.name}"
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre_name = gets
        genre = Genre.find_by_name(genre_name)
        songs = Song.all
            .select {|song| song.genre == genre}
            .sort_by {|song| song.name}
        songs.each_with_index do |song, index|
            puts "#{index + 1}. #{song.artist.name} - #{song.name}"
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        song_number = gets.to_i - 1
        songs = Song.all.sort_by {|song| song.name}
        # binding.pry


        if song_number >= 0 && song_number < songs.length
            song = songs[song_number]
            puts "Playing #{song.name} by #{song.artist.name}"
        end
    end
end
