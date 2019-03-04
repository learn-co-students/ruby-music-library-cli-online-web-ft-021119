require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist
  @@all = []

  def initialize(name, artist = nil)
    # binding.pry
    if artist != nil
      artist=(artist)
    else
      @artist = nil
    end
    @name = name
    @@all = []

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
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist_name)
    # binding.pry
    @artist = artist_name
    self.artist.add_song(self)
  end


end
