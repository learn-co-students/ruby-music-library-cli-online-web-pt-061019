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
    end
    command
  end

  def list_songs
    song_list = Song.all.sort { |a,b| a.name <=> b.name}
    binding.pry
    song_list.each_with_index do |song, index|
      # binding.pry
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

end
