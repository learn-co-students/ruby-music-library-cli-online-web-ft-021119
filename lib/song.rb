require_all 'lib/concerns'
require_relative 'concerns/common'

class Song
  include Common::InstanceMethods
  extend Common::ClassMethods
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  attr_accessor :name, :artist
  attr_reader :genre
  @@all = []

  def initialize(name, artist = "", genre = "")
    @name = name
    self.artist= artist if artist != ""
    self.genre= genre if genre != ""
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    if !(genre.songs.include?(self))
      genre.songs << self
      @genre = genre
    end
  end

  def self.new_from_filename(file)
    array = file.split(' - ').each(&:strip!)
      #array is [artist, song, genre, .mp3] as strings
    song = Song.new(array[1])
    song.artist = Artist.find_or_create_by_name(array[0])
    song.genre = Genre.find_or_create_by_name(array[2].gsub('.mp3',''))

    song
  end

  def self.create_from_filename(file)
    song = Song.new_from_filename(file)
    song.save
  end

  def self.all
    @@all
  end
end
