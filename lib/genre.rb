require 'pry'
require_relative './concerns.rb'

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
  def self.destroy_all 
    @@all.clear 
  end 
  def save 
    @@all << self 
  end 
  def self.create(type)
    new_genre = Genre.new(type)
    new_genre.save
    new_genre
  end 
  def songs 
    @songs 
  end 
  def artists
    array = []
    songs.each do |song_instance|
      array << song_instance.artist
    end 
    array.uniq
  end 
end 