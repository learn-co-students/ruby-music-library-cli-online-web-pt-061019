class MusicImporter
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        files = Dir.glob("#{path}/*.mp3")
        files.collect {|file| file.gsub("#{path}/", "")}
      end

      def import
        files.collect {|filename| imported_song = Song.create_from_filename(filename)}
      end

end