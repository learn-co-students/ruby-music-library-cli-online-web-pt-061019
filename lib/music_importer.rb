class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  
  def files
    Dir.entries(path).select {|entry| entry.include?(".mp3")}
  end
end