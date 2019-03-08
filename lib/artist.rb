# require 'pry'
class Artist
extend Concerns::Findable
attr_accessor :name, :songs, :genre
@@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all # Class reader
    @@all
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
    end
    self.songs << song unless songs.include?(song)
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end

  def self.find_by_name(name)
    self.all.detect{|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.destroy_all
      @@all.clear
  end

end
