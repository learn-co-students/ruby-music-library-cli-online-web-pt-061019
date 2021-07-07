class MusicLibraryController

  attr_reader :path, :music_importer

  def initialize(path = './db/mp3s')
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end


  def call
    command = nil
    until command == "exit" do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      command = gets
      case command
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      end
    end

  end

  def list_songs
    song_list = Song.all.uniq.sort { |a,b| a.name <=> b.name}
    song_list.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    song_list
  end

  def list_artists
    artist_list = Artist.all.uniq.sort { |a,b| a.name <=> b.name}
    artist_list.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    genre_list = Genre.all.uniq.sort { |a,b| a.name <=> b.name}
    genre_list.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    song_list = Song.all.uniq.sort { |a,b| a.artist <=> b.artist}
    song_list.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artist_list = Artist.all.uniq.sort { |a,b| a.name <=> b.name}
    artist_list.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    genre_list = Genre.all.uniq.sort { |a,b| a.name <=> b.name}
    genre_list.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    this_artist = gets
    if artist_object = Artist.find_by_name(this_artist)
      song_list = artist_object.songs.sort { |a,b| a.name <=> b.name}
      song_list.each_with_index do |song, index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    this_genre = gets
    if genre_object = Genre.find_by_name(this_genre)
      song_list = genre_object.songs.sort { |a,b| a.name <=> b.name}
      song_list.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
      puts "Which song number would you like to play?"
      song_number = gets.to_i - 1
      song_list = Song.all.uniq.sort { |a,b| a.name <=> b.name}
      if song_number >= 0 && song_number < 5
        puts "Playing #{song_list[song_number].name} by #{song_list[song_number].artist.name}"
        # binding.pry
      end
    end

end
