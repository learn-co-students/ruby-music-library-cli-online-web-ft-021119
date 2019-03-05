require 'pry'
class Song
  attr_accessor :name #, :artist
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist= nil, genre= nil)
  @name = name
  @artist = artist
  self.artist = artist if artist
  self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  #  Song.all << self
    #@@all << self
    #song
  end

  def self.create(name)
    song = new(name)
    song.save #unless @@all.include?(song.name)
    song
  end

  def self.find_by_name(name)
    #binding.pry
    #@@all == [] ? nil : @@all.pop
    #@@all.find(&:name)
    all.detect{ |s| s.name == name }
  end


  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(name)
    #song = Song.new((file_name)
    name.split("- ")[1]
    #binding.pry
  end
# def self.find_or_create_by_name(name)
#    # binding.pry
#     find_by_name(name) || create(name)
#   end
  #def self.create(name)
  #song = new(name)
  #song.save
  #song
  #end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{ |s| s.save }
  end

end
