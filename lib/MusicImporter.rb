class MusicImporter
    
    attr_reader :path

    def initialize(path)
        @path = path 
    end 

    def files 
        @files ||= Dir.glob("#{path}/*.mp3").collect {|t| t.gsub("#{path}/", "")}
    end 

    def import
        files.each {|name| Song.create_from_filename(name)}
    end 



end 