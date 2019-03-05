require_relative  "../lib/Concerns/findable"

class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs, :genres
  @@all = []

  def initialize(name)
  @name = name
  @songs = []
  #@songs << song
  #@genres = genres
  end

  def genres
    songs.map(&:genre).uniq
    #songs.genres.map.uniq {|w| w}
  end

  def self.all
  @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end

#  def songs
  #  self.songs # << song
#artist.songs.map(&:song)
#  end


  def add_song(song)
    #song.artist = self
  song.artist = self unless song.artist #if value is not nil will be true.
    #   # artist
  songs.push song unless songs.include?(song)
  end



end
