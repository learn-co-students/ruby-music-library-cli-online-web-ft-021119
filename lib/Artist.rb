require 'pry'

class Artist
  # attr_accessor :genres
    @@all = []
    def initialize(name)
      @name = name
      @songs = []
    end

    def self.create(name)
      artist = Artist.new(name)
      artist.save
      artist
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end

    def add_song(song)  #  #<Song:0x0000000221c670 @artist=nil, @name="In the Aeroplane Over the Sea">
      # binding.pry       # Self: #<Artist:0x0000000221c6e8 @name="Neutral Milk Hotel", @songs=[]>
      if song.artist != nil
        #do nothing
      else
        song.artist = self
      end

      if self.songs.include?(song)
        #do nothing
      else
        self.songs << song
      end
    end

    def genres
      @genres = []
      self.songs.collect {|song|
        @genres << song.genre
      }
      @genres.flatten.uniq
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

    def songs
      @songs
    end
end
