class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    artist= @artist
    genre= @genre
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


# #??????
#   def artist=(artist)
#     @artist = artist
#     Artist.add_song(self)
#   end

  def genre
    self.genre = @genre
  end

  def .find_by_name(name)
    self.each do |song|
      if song.name = name
        song
      end
    end
  end


end
