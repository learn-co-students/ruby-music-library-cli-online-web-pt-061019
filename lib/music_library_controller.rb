require 'pry'

class MusicLibraryController 
  attr_reader :path
  
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
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
    input = gets.strip
   
    case input.downcase
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      when "exit"
        return 
      else
        call
    end
  end
  
  
  def list_songs
    sorted_songs = Song.all.sort {|a, b| a.name <=> b.name}
    sorted_songs.each.with_index {|song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    }
    return sorted_songs
  end
  
  def list_artists
    sorted_artists = Artist.all.sort {|a, b| a.name <=> b.name}
    sorted_artists.each.with_index {|artist, index| 
      puts "#{index + 1}. #{artist.name}"
    }
  end
  
  def list_genres
    sorted_genres = Genre.all.sort {|a, b| a.name <=> b.name}
    sorted_genres.each.with_index {|genre, index| 
      puts "#{index + 1}. #{genre.name}"
    }
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    artist = Artist.find_by_name(artist_name)
    
    if artist
      sorted = artist.songs.sort {|a, b| a.name <=> b.name}
      sorted.each_with_index {|song, index| 
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
    end
      
  end
  
  def list_songs_by_genre 
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    genre = Genre.find_by_name(genre_name)
    
    if genre
      sorted = genre.songs.sort {|a, b| a.name <=> b.name}
      sorted.each_with_index {|song, index| 
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    end
  end
  
  def play_song 
    puts "Which song number would you like to play?"
    song_num = gets.strip.to_i
    
    if (1..Song.all.length).include?(song_num)
      listed = Song.all.sort {|a, b| a.name <=> b.name}
      puts "Playing #{listed[song_num-1].name} by #{listed[song_num-1].artist.name}"
    end
  end

end # end of class