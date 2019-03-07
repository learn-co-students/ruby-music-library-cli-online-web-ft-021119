require 'pry'
class Song 
  
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist if artist
    self.genre = genre if genre
    @@all << self
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self)
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def save 
    self.class.all << self 
  end 
  
  def self.create(name)
    song = new(name)
    song 
  end 
  
  def self.find_by_name(name)
    all.find{|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name) 
    find_by_name(name) || create(name)
  end 
  
  def self.new_from_filename(filename)
    artist, song, genre = filename.split(" - ")
    genre = genre.gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    new(song, artist, genre)
  end 
  
  def self.create_from_filename(filename)
    new_from_filename(filename)
  end 
  
end 