class Genre

extend Concerns::Findable

attr_accessor :name
attr_reader :songs

@@all = []

def initialize(name)
@name = name
@songs = []
end

def self.all
@@all
end

 def save
   self.class.all << self
 end

def self.create(genre)
  genre = new(genre)
  genre.save
  genre
end 

 def self.destroy_all
   all.clear
 end

 def artists
   songs.collect(&:artist).uniq
 end
end
