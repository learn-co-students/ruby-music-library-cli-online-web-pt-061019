class MusicLibraryController

    def initialize(path = "./db/mp3s")
        MusicImporter.new(path).import
    end

    def call 
        input = ""
        while input != "exit"
            puts "Welcome to your music library!"
            puts "To list all of your songs, enter 'list songs'."
            puts "To list all of the artists in your library, enter 'list artists'."
            puts "To list all of the genres in your library, enter 'list genres'."
            puts "To list all of the songs by a particular artist, enter 'list artist'."
            puts "To list all of the songs of a particular genre, enter 'list genre'."
            puts "To play a song, enter 'play song'."
            puts "To quit, type 'exit'."
            puts "What would you like to do?"

            input = gets.strip

            case input
            when "list songs"
                list_songs
            when "list artists"
                list_artists
            when "list genres"
                list_genres
            when "list artist"
                list_artist
            when "list genre"
                list_genre
            when "play song"
                play_song
            when "exit"
                exit 
            end 
        end 
    end 

    def list_songs
        alphabetized_list = Song.all.sort{|a,b| a.name <=> b.name}.each_with_index{|file,index| puts "#{index +1}. #{file.artist.name} - #{file.name} - #{file.genre.name}"}
    end 

    def list_artists
        Artist.all.sort{|a,b| a.name <=> b.name}.each_with_index{|artist,index| puts "#{index +1}. #{artist.name}"}
    end 

    def list_genres
       Genre.all.sort{|a,b| a.name <=> b.name}.each_with_index{|genre,index| puts "#{index +1}. #{genre.name}"}
    end 

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist_name = gets.strip
        if artist = Artist.find_by_name(artist_name)
            artist.songs.sort{|a, b| a.name <=> b.name}.each.with_index{|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"} 
        end 
    end 

    def list_songs_by_genre
        puts "Please enter the name of a genre:" 
        genre_name = gets.strip
        if genre = Genre.find_by_name(genre_name)
            genre.songs.sort{|a, b| a.name <=> b.name}.each.with_index{|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"} 
        end 
    end 

    def play_song
        puts "Which song number would you like to play?"
        song_number = gets.strip.to_i - 1
        alphabetized_list = Song.all.sort{|a,b| a.name <=> b.name}
            if song_number > 1 && song_number < alphabetized_list.length 
                song = alphabetized_list[song_number]
                puts "Playing #{song.name} by #{song.artist.name}"
            end 
    end 
end 