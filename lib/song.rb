require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist, :genre
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
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
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end
  
  #def self.find_by_name(name)
  #  self.all.each {|element| return element if element.name == name}
  #  return nil
  #end
#  
#  def self.find_or_create_by_name(name)
#    return self.find_by_name(name) if self.find_by_name(name) != nil
#    self.create(name)
#  end
  
  def self.new_from_filename(filename)
    array = filename.split(" - ")
    array2 = array[2].split(".")
    song = array[1]
    artist = array[0]
    genre = array2[0]
    
    new_artist = Artist.find_or_create_by_name(artist)
    new_genre = Genre.find_or_create_by_name(genre)
    new_song = self.new(song, new_artist, new_genre)
  end
  
  def self.create_from_filename(filename)
    new = self.new_from_filename(filename)
    #binding.pry
    new.save
    new
  end
end