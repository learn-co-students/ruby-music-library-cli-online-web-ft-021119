require 'pry'
class Song

  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
  #Genre=
    if genre == nil
      #do nothing
    else
      self.genre=(genre)
    end
  #Artist=
    if artist == nil
      #do nothing
    else
      self.artist=(artist)
    end
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

  def self.find_by_name(name)
    @@all.find {|song|
      song.name == name
    }
  end

  def self.find_or_create_by_name(name)
    # binding.pry
      if (self.find_by_name(name) != nil) == true
          self.find_by_name(name)#do nothing additional
      else
          self.create(name)
      end
  # ########
    #   @@all.each {|song|
    #   # binding.pry
    #   if song.name == name
    #     return song #Found song by name
    #   else
    #     Song.new(name) #Create song by name
    #   end
    # }
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    # binding.pry
    @genre = genre
    if genre.songs.include?(self)
      #do nothing
    else
      genre.songs << self
    end
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
