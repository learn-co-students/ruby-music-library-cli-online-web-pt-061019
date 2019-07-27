class MusicImporter 
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    # Dir.children(self.path).each {|filename| Song.new_from_filename(filename)}
    
    files = Dir.glob("#{path}/*.mp3").map {|file| file.gsub("#{path}/","")}
  end
  
  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end
end