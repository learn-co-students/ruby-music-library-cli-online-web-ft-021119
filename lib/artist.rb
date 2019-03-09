class Artist
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def add_song(song)
        song.artist = self unless song.artist
        @songs.push song unless @songs.include?(song)
    end

    def genres
        songs.map(&:genre).uniq
    end


    def self.all
        @@all
    end

    def self.destroy_all
        all.clear
    end

    def save
        self.class.all << self
    end

    def self.create(name)
        new_artist = Artist.new(name)
        new_artist.save
        new_artist
    end

end
