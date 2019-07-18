class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).reject{|f| f == '.' || f == '..'}
    #
  end
end
