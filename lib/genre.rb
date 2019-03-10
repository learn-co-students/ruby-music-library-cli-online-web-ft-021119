require_relative './concerns.rb'
class Genre
  attr_accessor :name, :songs
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    temp = self.new(name)
    temp.save
    temp
  end
  
  def artists
    array = []
    @songs.each {|element| array << element.artist}
    array.uniq
  end
end