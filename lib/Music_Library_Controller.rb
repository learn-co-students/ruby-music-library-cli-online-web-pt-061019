class MusicLibraryController
  attr_accessor :path
  def initialize(path = nil)
    @path = path if path
    MusicImporter.new(path)
  end
end
