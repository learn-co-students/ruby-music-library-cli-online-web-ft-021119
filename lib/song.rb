require 'pry'
require_relative './concerns.rb'

class Song 
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre #bc writer is explicit below 
  @@all = []
  def initialize(name, artist=nil, genre=nil )
    @name = name
    if artist != nil 
      self.artist = artist 
    end 
    if genre != nil 
      self.genre = genre
    end 
  end
  def artist=(artist) # artist = #<Artist:0x0000000200de60 @name="Neutral Milk Hotel", @songs=[]>
    @artist = artist
    artist.add_song(self)
  end
  def genre=(genre) #genre = #<Genre:0x00000001c58680 @name="indie rock", @songs=[]>
    @genre=genre
    if !genre.songs.include?(self)
      genre.songs << self 
    end 
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
  def self.create(title)
    new_song = Song.new(title)
    new_song.save
    new_song
  end
  def self.new_from_filename(file) #file = "Thundercat - For Love I Come - dance.mp3"
    artist, song, genre1 = file.split(" - ")
    genre = genre1.chomp(".mp3")
 
    new_artist = Artist.find_or_create_by_name(artist)
    new_genre = Genre.find_or_create_by_name(genre)
    new_song = self.new(song, new_artist, new_genre)
  end 
  def self.create_from_filename(file) #file = "Thundercat - For Love I Come - dance.mp3"
    new_song = self.new_from_filename(file)
    new_song.save
    new_song
  end 
end

# moved to concerns.RUBY_VERSION def self.find_or_create_by_name(song_name) #song_name = "In the Aeroplane Over the Sea"
#     find_by_name(song_name) || create(song_name)
#   end  
#   def self.find_by_name(song_name)
#     @@all.find {|song_instance| song_instance.name == song_name}
#   end 