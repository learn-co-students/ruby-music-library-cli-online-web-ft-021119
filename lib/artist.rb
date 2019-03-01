require 'pry'

class Artist
  attr_accessor :name, :songs, :genres

  @@all = []

  def initialize(name)
    @name = name
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

  def songs
    @songs
  end

  def add_song(song)
    if !song.artist
      song.artist = self
      @songs << song
    end
  end

  def genres
    genres = @songs.map {|song| song.genre}
    @genres = genres.uniq
  end
end
