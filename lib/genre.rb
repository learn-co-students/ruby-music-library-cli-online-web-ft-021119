class Genre
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @@all = []
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def artists
    genre_artists = []
    # binding.pry
    self.songs.each do |song|
      if !genre_artists.include?(song.artist)
        genre_artists << song.artist
      end
    end
    # binding.pry
    genre_artists
  end


end
