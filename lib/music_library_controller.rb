require 'pry'
class MusicLibraryController
  attr_accessor :path
  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end
  
  def call
    user_input = nil
    
    puts "Welcome to your music library!"
    while user_input != 'exit'
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      
      user_input = gets.strip
      
      case user_input
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
      end
    end
  end
  
  def list_songs
    sorted_songs = Song.all.sort_by {|song| song.name}
    sorted_songs.each_with_index {|song, index| 
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  
  def list_artists
      sorted_artists = Artist.all.sort_by {|artist| artist.name}
      sorted_artists.each_with_index {|artist, index| 
        puts "#{index + 1}. #{artist.name}"}
  end
  
  def list_genres
    sorted_genres = Genre.all.sort_by {|genre| genre.name}
      sorted_genres.each_with_index {|genre, index| 
        puts "#{index + 1}. #{genre.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input_artist = gets.strip
     if artist = Artist.find_by_name(input_artist)
      songs = artist.songs.sort_by {|song| song.name}
      songs.each_with_index {|song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input_genre = gets.strip
     if genre = Genre.find_by_name(input_genre)
      songs = genre.songs.sort_by {|song| song.name}
      songs.each_with_index {|song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i
    if (1..Song.all.length).include?(song_number)
      song = Song.all.sort_by {|song| song.name}[song_number - 1]
    puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end

