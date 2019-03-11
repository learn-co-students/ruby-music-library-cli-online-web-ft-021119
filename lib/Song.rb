class Song

  @@all = []
  def initialize(name, artist = nil)
    @name = name
    @artist = artist
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def save
    @@all << self
  end
end
