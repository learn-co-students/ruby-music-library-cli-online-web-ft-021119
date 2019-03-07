class Song
attr_accessor :name
attr_reader :artist, :genre
@@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
    # save
  end

  def self.all # Class reader
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
    genre.songs << self
    end
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end


end
