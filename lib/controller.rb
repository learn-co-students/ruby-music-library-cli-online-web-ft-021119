class MusicLibraryController
  attr_reader :importer, :input
  attr_accessor :list

  def initialize(path = './db/mp3s')
    @importer = MusicImporter.new(path)
    @importer.import
  end

  def call
    until @input == 'exit'
      puts ("Welcome to your music library!")
      puts ("To list all of your songs, enter 'list songs'.")
      puts ("To list all of the artists in your library, enter 'list artists'.")
      puts ("To list all of the genres in your library, enter 'list genres'.")
      puts ("To list all of the songs by a particular artist, enter 'list artist'.")
      puts ("To list all of the songs of a particular genre, enter 'list genre'.")
      puts ("To play a song, enter 'play song'.")
      puts ("To quit, type 'exit'.")
      puts ("What would you like to do?")
      @input = gets.chomp.downcase
    end
  end

  #-----------CLI Methods--------------------
  def list_songs
    @list = Song.all.sort{|a,b| a.name <=> b.name}
    @list.each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    @list = Artist.all.sort{|a,b| a.name <=> b.name}
    @list.each_with_index do |artist, i|
      puts "#{i+1}. #{artist.name}"
    end
  end

  def list_genres
    @list = Genre.all.sort{|a,b| a.name <=> b.name}
    @list.each_with_index do |artist, i|
      puts "#{i+1}. #{artist.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    name = gets.chomp
    artist = Artist.find_by_name(name)
    if artist
      songs = artist.songs.sort{|a,b| a.name <=> b.name}
      songs.each_with_index do |song, i|
        puts "#{i+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    name = gets.chomp
    genre = Genre.find_by_name(name)
    if genre
      songs = genre.songs.sort{|a,b| a.name <=> b.name}
      songs.each_with_index do |song, i|
        puts "#{i+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    list_songs
    puts "Which song number would you like to play?"
    number = gets.chomp
    binding.pry
    if number.to_i == [1..self.list.size]
      puts "Is it working?"
      # song = self.list[number.to_i - 1]
      # puts "Playing #{song.name} by #{song.artist.name}"
    else
      "Something is wrong"
    end

  end


end #END OF CLASS
