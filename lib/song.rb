class Song
extend Concerns::Findable
attr_accessor :name
attr_reader :artist, :genre
@@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil #check this again
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

  def self.find_by_name(name)
    @@all.detect{|artist| artist.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end


end
