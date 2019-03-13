require 'pry'
class Song

  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
  #Genre=
    self.genre=(genre) if genre     # if genre == nil
                                    #   #do nothing
                                    # else
                                    #   self.genre=(genre)
                                    # end
  #Artist=
    self.artist=(artist) if artist  # if artist == nil
                                    #   #do nothing
                                    # else
                                    #   self.artist=(artist)
                                    # end
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
      if (self.find_by_name(name) != nil) == true
          self.find_by_name(name)
      else
          self.create(name)
      end

    #   @@all.each {|song|
    #   # binding.pry
    #   if song.name == name
    #     return song #Found song by name
    #   else
    #     Song.new(name) #Create song by name
    #   end
    # }
  end

  def self.new_from_filename(filename)
    part = filename.split(" - ")
    name = part[1].strip
    genre = part[2].chomp(".mp3")
    # binding.pry
    artist = part[0].strip
# binding.pry
    find_artist = Artist.find_or_create_by_name(artist)
    find_genre = Genre.find_or_create_by_name(genre)
    new_song = Song.new(name,find_artist,find_genre)

  #Pre-refactoring:
    # song = Song.new(filename.split("-")[1].strip)
    # new_genre = Genre.new("dance")
    # song.genre=(new_genre)
    # new_genre.songs = song
    # new_genre.save
    # new_artist = Artist.new(filename.split("-")[0].strip)
    # new_artist.add_song(song)
    # new_artist.save
    # song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
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
