class MusicLibraryController

attr_accessor :path

def initialize(file_path = "./db/mp3s")
  @path = file_path
  MusicImporter.new(file_path).import
end

def call
  input = nil
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
  if input == "list songs"
    self.list_songs
  elsif input == "list artists"
    self.list_artists
  elsif input == "list genres"
    self.list_genres
  elsif input == "list artist"
    self.list_songs_by_artist
  elsif input == "list genre"
    self.list_songs_by_genre
  elsif input == "play song"
    self.play_song    
end
end
end

def list_songs
  new_array = []
#  second_array = []
  new_array = Song.all.sort_by {|object| object.name}
  new_array.each_with_index do |song_object,number|
    puts "#{number.to_i + 1}. #{song_object.artist.name} - #{song_object.name} - #{song_object.genre.name}"
#    second_array << "#{number.to_i + 1}. #{song_object.artist.name} - #{song_object.name} - #{song_object.genre.name}"
  end
#  return second_array
end

def list_artists
  new_array = []
  new_array = Artist.all.sort_by {|object| object.name}
  new_array.each_with_index do |artist_object,number|
    puts "#{number.to_i + 1}. #{artist_object.name}"
  end
end

def list_genres
  new_array = []
  new_array = Genre.all.sort_by {|object| object.name}
  new_array.each_with_index do |genre_object,number|
    puts "#{number.to_i + 1}. #{genre_object.name}"
  end
end

def list_songs_by_artist
  new_array = []
  user_input = nil
  puts "Please enter the name of an artist:"
  user_input = gets.strip
  if Artist.find_by_name(user_input) != nil
  new_array = Artist.find_by_name(user_input).songs.sort_by {|object| object.name}
  new_array = new_array.each_with_index do |song_object,number|
    puts "#{number.to_i + 1}. #{song_object.name} - #{song_object.genre.name}"
      end
  end
end

def list_songs_by_genre
  new_array = []
  new_user_input = nil
  puts "Please enter the name of a genre:"
  new_user_input = gets.strip
  if Genre.find_by_name(new_user_input) != nil
  new_array = Genre.find_by_name(new_user_input).songs.sort_by {|object| object.name}
  new_array = new_array.each_with_index do |song_object,number|
    puts "#{number.to_i + 1}. #{song_object.artist.name} - #{song_object.name}"
      end
  end
end

def play_song
  user_input = nil
  puts "Which song number would you like to play?"
#  self.list_songs
  user_input = gets.strip
  if Song.all.length > user_input.to_i && user_input.to_i >= 1
    sorted_list = Song.all.sort_by {|object| object.name}
#  array.each do |full_name|
#    new_array = full_name.split(". ")
#    number = new_array[0]
#    if user_input == number
    puts "Playing #{sorted_list[user_input.to_i - 1].name} by #{sorted_list[user_input.to_i - 1].artist.name}"
  end
end

end
