class Artist
  attr_accessor :songs
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
