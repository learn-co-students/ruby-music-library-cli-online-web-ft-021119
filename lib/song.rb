require 'pry'
class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name, artist_name = nil)
    # binding.pry
    if artist_name != nil
      self.artist=(artist_name)
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
