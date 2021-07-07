require 'pry'

class MusicImporter

  attr_reader :path

  def initialize(file_path)
    @path = file_path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "")}
  end

  #spec 009
  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
