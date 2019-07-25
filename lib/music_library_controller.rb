class MusicLibraryController
  attr_reader :path
  
  def initialize(path = "./db/mp3s")
    @path =path
    new_music_importer_object = MusicImporter.new(path)
    new_music_importer_object.import
  end
  
  def call
    user_input = ""
    while user_input != "exit"
    puts "Welcome to your music library!"
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of your songs, enter 'list songs'."
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
    Song.all.sort {|a, b| a.name <=> b.name}.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    sort_by_artist = Artist.all.sort_by do |artist|
      artist.name
    end
    sort_by_artist.each.with_index(1) do |artist, index|
    puts "#{index}. #{artist.name}"
    end
  end
  
  def list_genres
    sort_by_genre = Genre.all.sort_by do |genre|
      genre.name
    end
    sort_by_genre.each.with_index(1) do |genre, index|
    puts "#{index}. #{genre.name}"
    end
  end
end
