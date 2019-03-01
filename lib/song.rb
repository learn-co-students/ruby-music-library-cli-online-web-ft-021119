class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @genre = genre
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
    if !Genre.songs.include?(self)
      Genre.songs << self
    end
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name = name}
  end

  def self.find_or_create_by_name(name)
     self.find_by_name.tap || self.create(name)
  end



end
