require 'pry'
class MusicLibraryController

  def initialize(path = ("./db/mp3s"))
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    loop until gets.chomp == exit do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      gets.chomp
    end
  end


  def list_songs
    sorted_list = []
    song_names = Song.all.collect {|s| s.name}.sort
    song_names.each do |names|
      Song.all.each do |songs|
        if songs.name == names
          sorted_list << songs
        end
      end
    end
    sorted_list.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    # binding.pry
  end

  def list_artists
    artists = Song.all.collect {|s| s.artist.name}.uniq.sort
    binding.pry
    artists.each_with_index {|a| puts "#{index+1}. #{artist}"}



    # sorted_list = []
    # artist_names = (Song.all.collect {|s| s.artist.name}).sort
    # # binding.pry
    # artist_names.each do |artist|
    #   # binding.pry
    #   Song.all.each do |song|
    #     # binding.pry
    #       if song.artist.name == artist
    #         sorted_list << song.artist.name
    #       end
    #   end
    # end
    # # binding.pry
    #
    # sorted_list.uniq.each_with_index do |artist, index|
    #   # binding.pry
    #   puts "#{index+1}. #{artist}"
    # end

  end


end
