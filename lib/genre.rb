class Genre
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @artists = []
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    instance = self.new(name)
    @@all << instance
    instance
  end
end
