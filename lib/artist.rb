require_relative "../config/environment.rb"
require_relative "./concerns/findable.rb"

require "pry"
class Artist
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name

    @songs = []
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

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end

    if @songs.include?(song) == false
      @songs << song
    end
  end

  def songs
    @songs
  end

  def genres
    genres = songs.collect do |song|
      song.genre
    end
    genres.uniq
  end
end
