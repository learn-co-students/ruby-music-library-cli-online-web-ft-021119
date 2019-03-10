require 'pry'
require_relative './concerns.rb'
class Artist
  attr_accessor :name, :songs, :artist
  #attr_reader :artist
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
  
  def add_song(song)
    song.artist = self if song.artist == nil
    @songs.each {|element| return element if element == song}
    @songs << song
  end
  
  def genres
    array = []
    @songs.each {|element| array << element.genre}
    array.uniq
  end
end