require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist_name = nil, genre = nil)
    # binding.pry
    if artist_name != nil
      self.artist=(artist_name)
    end
    @name = name
    if genre != nil
      self.genre=(genre)
    end
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
    song = Song.new(name)
    @@all << song
    song
  end

  def artist=(artist_name)
    # binding.pry
    @artist = artist_name
    self.artist.add_song(self)

  end

  def genre=(genre)
    @genre = genre
    if !self.genre.songs.include?(self)
      self.genre.songs << self
    end
  end

  def self.find_by_name(name)
    # binding.pry
    matching_song = nil
    self.all.each do |song|
      # binding.pry
      if song.name == name
        matching_song = song
        # binding.pry
      else
        nil
      end
    end
    matching_song
  end


  def self.find_or_create_by_name(name)
    # binding.pry
    # Song.find_by_name(name)  || Song.create(name)
    song = Song.find_by_name(name)
    # binding.pry
    if song == nil
      Song.create(name)
    else
      Song.find_by_name(name)
    end
  end



  def self.new_from_filename(filename)
    # binding.pry
    artist = Artist.find_or_create_by_name(filename.split(/\ - |.mp3/)[0])
    genre = Genre.find_or_create_by_name(filename.split(/\ - |.mp3/)[2])
    song = filename.split(/\ - |.mp3/)[1]
    # binding.pry
    song = Song.new(song, artist, genre)

  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

end
