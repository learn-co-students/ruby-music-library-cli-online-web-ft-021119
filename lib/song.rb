class Song
  attr_accessor :name, :artist, :genre, :filename

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless genre.songs.include?(self)
  end

  def Song.create(name)
      song = Song.new(name)
      song.name = name
      song
    end

  def self.find_or_create_by_name(name)
     Song.find_by_name(name) || Song.create(name)
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.new_from_filename(filename)
    artist, name, genre = filename.gsub(".mp3", "").split(" - ") if filename
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
    @@all << self

  end

end
