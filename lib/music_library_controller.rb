require 'pry'
class MusicLibraryController
  attr_accessor :path
  def initialize(path = './db/mp3s')
    @path = path if path

    MusicImporter.new(path).tap{|s| s.import}
  end

  def call
    user_input = nil
      puts "Welcome to your music library!"
    until  user_input == 'exit'
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
      else
      end

    end
  end

  def list_songs
    songs = []
    songs = Song.all.sort{|a,b| a.name <=> b.name}
    songs.each_with_index do |s,idx|
      puts "#{idx+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    artists = []
    artists = Artist.all.uniq.sort{|a,b| a.name <=> b.name}
    artists.each_with_index do |a,idx|
      puts "#{idx+1}. #{a.name}"
    end
  end

  def list_genres
    genres = []
    genres = Genre.all.uniq.sort{|a,b| a.name <=> b.name}
    genres.each_with_index do |a,idx|
      puts "#{idx+1}. #{a.name}"
    end
  end

  def list_songs_by_artist
    user_input = nil
    songs = []

    puts "Please enter the name of an artist:"
    user_input = gets.strip
    artist =  Artist.find_by_name(user_input)
    if artist
      songs = artist.songs.sort{|a,b| a.name <=> b.name}
      songs.each_with_index do |s,idx|
        puts "#{idx+1}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    user_input = nil
    songs = []

    puts "Please enter the name of a genre:"
    user_input = gets.strip
    genre =  Genre.find_by_name(user_input)

    if genre
      songs = genre.songs.sort{|a,b| a.name <=> b.name}
      songs.each_with_index do |s,idx|
        puts "#{idx+1}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    user_input = nil
    puts "Which song number would you like to play?"
    user_input = gets.strip.to_i

    songs = []
    songs = Song.all.sort{|a,b| a.name <=> b.name}
    s = songs[user_input -1]

    if s and user_input > 0
      puts "Playing #{s.name} by #{s.artist.name}"
    end
  end

end