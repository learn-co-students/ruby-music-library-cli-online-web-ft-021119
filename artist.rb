require_all 'lib/concerns'

class Artist
  include Common::InstanceMethods
  extend Common::ClassMethods
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    song.artist = self if !(song.artist == self)
    @songs << song if !(self.songs.include?(song))
  end

  def genres
    @songs.collect{|song| song.genre}.uniq
  end

  def self.all
    @@all
  end
end
