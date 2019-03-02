require_relative "../config/environment.rb"
require_relative "./concerns/findable.rb"
require "pry"

class Song
  extend Concerns::Findable
  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

  def initialize(name, artist = nil , genre = nil )
    @name = name
    if artist != nil
      self.artist = artist
    else
      @artist = artist
    end

    if genre != nil
      self.genre = genre
    else
      @genre = genre
    end
  end

  def self.all
    @@all
  end

  def save
    @@all << self
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
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def self.new_from_filename(file_name)
    file_attributes = file_name.chomp(".mp3").split(" - ")
    file_artist = file_attributes[0]
    song_name = file_attributes[1]
    file_genre = file_attributes[2]

    song = find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(file_artist)
    song.genre = Genre.find_or_create_by_name(file_genre)
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    @@all << song
  end
end
