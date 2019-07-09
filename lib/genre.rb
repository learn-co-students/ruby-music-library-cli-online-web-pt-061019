class Genre
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    @save = name
    @@all << self
    self
  end

  def save
    @@all << self
  end

  def artist
    @song.collect{|s| s.artist}.uniq
  end
end
