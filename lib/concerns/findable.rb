module Concerns::Findable #namespaced

  def find_by_name(name)
    self.all.detect{|o|o.name == name}
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end


  def new_from_filename(filename)
    songname = filename.split(" - ")[1]
    artistname = filename.split(" - ")[0]
    genrename = filename.split(" - ")[2].split(".")[0]
    new_artist = Artist.new(artistname)
    new_genre = Genre.new(genrename)
    song = self.new(songname, new_artist , new_genre)
    song
  end
end
