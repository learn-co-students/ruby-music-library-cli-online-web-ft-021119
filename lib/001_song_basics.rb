require 'pry'
class Song
  attr_accessor :name
  #attr_reader :name
  @@all = []

  def initialize(name)
  @name = name
  end

  def self.all
  @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  #  Song.all << self
    #@@all << self
    #song
  end
  #def self.create(name)
  #song = new(name)
  #song.save
  #song
  #end

  def self.create(name)
    song = new(name)
    song.save
    song
  end

end
#binding.pry
