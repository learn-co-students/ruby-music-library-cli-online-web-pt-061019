class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
  Dir['**/*.mp3']
  @file ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/","")}
  # binding.pry
end
end
