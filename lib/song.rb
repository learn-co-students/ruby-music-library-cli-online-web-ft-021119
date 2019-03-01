class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    #@artist= Artist.add_song(self)
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    instance = self.new(name)
    @@all << instance
    instance
  end

  # def artist(self)
  #   Artist.add_song
  # end

  def genre
    self.genre = @genre
    if !Genre.songs.include?(self)
      Genre.songs << self
    end
    @genre
  end

  def self.find_by_name(name)
    self.each do |song|
      if song.name = name
        song
      end
    end
  end


end
