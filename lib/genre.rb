class Genre
extend Concerns::Findable
attr_accessor :name, :songs
@@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all # Class reader
    @@all
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def save
    @@all << self
  end

  def artists
    songs.collect{|song| song.artist}.uniq
  end

  def self.destroy_all
      @@all.clear
  end

end
