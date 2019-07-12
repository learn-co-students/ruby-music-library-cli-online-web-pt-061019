require 'pry'
class MusicLibraryController
  attr_accessor :path
  def initialize(path = './db/mp3s')
    @path = path if path
    # mi = MusicImporter.new(path)
    # mi.import
    # mi

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
    end
  end

  def list_songs
    # ("1. Thundercat - For Love I Come - dance")
    # ("2. Real Estate - Green Aisles - country")
    # ("3. Real Estate - It's Real - hip-hop")
    # ("4. Action Bronson - Larry Csonka - indie")
    # ("5. Jurassic 5 - What's Golden - hip-hop")
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
    # binding.pry
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
    user_input = gets.strip
  end

end
