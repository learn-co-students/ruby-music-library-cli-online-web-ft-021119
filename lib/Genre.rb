require 'pry'
class Genre
  attr_accessor :songs
    @@all = []
    def initialize(name)
      @name = name
      @songs = []
    end

    def self.create(name)
      genre = Genre.new(name)
      genre.save
      genre
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end

    def artists
      # binding.pry
      @artists = []
      self.songs.collect {|song|
        @artists << song.artist
      }
      @artists.flatten.uniq
    end

    def name
      @name
    end

    def name=(name)
      @name = name
    end

    def save
      @@all << self
    end
end
