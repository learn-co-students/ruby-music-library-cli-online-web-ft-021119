require_all 'lib/concerns'

class Song
  include Common::InstanceMethods
  extend Common::ClassMethods
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
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
    array = file.split(/[.-]/)
    #array returns [artist, song, genre, .mp3] as strings
    song = self.create(array[1].strip)
    # song.artist.class.find_or_create_by_name(array[0].strip)
    # song.genre.class.find_or_create_by_name(array[2].strip)
  end

  def self.all
    @@all
  end
end
