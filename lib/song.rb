class Song
    extend Concerns::Findable

    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre=nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs.push self unless genre.songs.include? self
    end

    def self.find_by_name(name)
        @@all.find{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        find_by_name(name) || Song.create(name)
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

    def self.create(song_name)
        new_song = Song.new(song_name)
        new_song.save
        new_song
    end

    def self.new_from_filename(filename)
        artist, name, genre = filename.gsub(".mp3", "").split(" - ") if filename
        artist = Artist.find_or_create_by_name(artist)
        genre = Genre.find_or_create_by_name(genre)
        new(name, artist, genre)
    end

    def self.create_from_filename(name)
        new_from_filename(name).save
    end
end
