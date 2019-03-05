#require_relative  "../lib/Concerns/findable"

class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
  @@all = []


  def initialize(name) #, songs) #, genre = )
  @name = name
  @songs = []

  end

  def artists
    songs.map(&:artist).uniq
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
    genre = new(name)
    genre.save
    genre
  end

end
