require 'pry'
require_relative './concerns.rb'

class Artist 
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
  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end 
  def songs
    @songs 
  end 
  def add_song(song) #song = #<Song:0x00000001676780 @artist=nil, @name="In the Aeroplane Over the Sea"
      song.artist = self if song.artist.nil?
      @songs << song if !@songs.include?(song)
  end
  # def genres 
  #   songs.map do |song_instance|
  #     song_instance.genre 
  #   end
  #   songs.uniq
  # end 
  def genres  #How to shorten? 
    array = []
    songs.each do |song_instance|
      array << song_instance.genre 
    end
    array.uniq
  end 
end 