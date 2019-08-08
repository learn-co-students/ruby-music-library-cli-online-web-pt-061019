class MusicImporter

attr_accessor :path

def initialize(file_path)
  @path = file_path
end

def files
    Dir.children(@path).each do |filename|
      puts filename
    end
end

def import
  Dir.children(@path).each do |filename|
    Song.create_from_filename(filename)
  end
end

end
