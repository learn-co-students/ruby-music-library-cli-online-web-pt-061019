class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist=nil)
    @name = name
    @artist = artist if artist
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name, artist = nil)
      new(name, artist).tap{|s| s.save}
  end

  def save
    @@all << self
  end

  # def artist=(name)
  #   @artist = name
  # end

  def self.find_by_name(name)
    @@all.detect{|artist|artist.name == name}
  end

  def find_or_create_by_name

  end

end
