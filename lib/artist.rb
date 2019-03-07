class Artist
attr_accessor :name, :songs, :genre
@@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all # Class reader
    @@all
  end

  def genres(genre)
    songs.genre
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def save
    @@all << self
  end

  def add_song(song)
    if !song.artist
        song.artist = self
    self.songs << song
    end
  end

  def self.destroy_all
      @@all.clear
  end



  end
