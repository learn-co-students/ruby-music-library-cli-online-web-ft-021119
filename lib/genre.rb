require 'concerns/findable.rb'

class Genre


  extend Concerns::Findable


  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
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
    genre = Genre.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def artists
    genre_artists = []
    # binding.pry
    self.songs.each do |song|
      if !genre_artists.include?(song.artist)
        genre_artists << song.artist
      end
    end
    # binding.pry
    genre_artists
  end

  def self.find_or_create_by_name(name)
    super || self.create(name)
  end


end
