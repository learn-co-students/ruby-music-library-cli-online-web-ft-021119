require 'concerns/findable.rb'

class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @@all = []
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
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end

  def genres
    artist_genres = []
    # binding.pry
    self.songs.each do |song|
      if !artist_genres.include?(song.genre)
        artist_genres << song.genre
      end
    end

    # binding.pry
    artist_genres
  end

  def self.find_or_create_by_name(name)
    super || self.create(name)
  end

end
