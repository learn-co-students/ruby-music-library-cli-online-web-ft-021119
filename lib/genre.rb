require_all 'lib/concerns'

class Genre
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

  def artists
    @songs.collect{|song| song.artist}.uniq
  end

  def self.all
    @@all
  end
end
