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
    # binding.pry
    artists = Artist.all.collect {|a| a.name}.sort
    # binding.pry
    artists.each_with_index {|a, i| puts "#{i+1}. #{a}"}
  end


  def list_genres
    genres = Genre.all.collect {|g| g.name}.sort
    genres.each_with_index {|g, i| puts "#{i+1}. #{g}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    gets.chomp
    # binding.pry
    artist_songs = {}
    if Artist.all.collect {|a| a.name}.include?(gets)
      # binding.pry
      Song.all.each do |song|
        if song.artist.name == gets
          artist_songs[song.name] = song.genre.name
        end
      end
    end
    # binding.pry
    artist_songs = artist_songs.sort
    # binding.pry
    artist_songs.each_with_index {|song, i| puts "#{i+1}. #{song[0]} - #{song[1]}" }
  end


  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    gets.chomp
    # binding.pry
    genre_songs = {}
    if Genre.all.collect {|a| a.name}.include?(gets)
      # binding.pry
      Song.all.each do |song|
        if song.genre.name == gets
          genre_songs[song.name] = song.artist.name
        end
      end
    end
    # binding.pry
    genre_songs = genre_songs.sort
    # binding.pry
    genre_songs.each_with_index {|genre, i| puts "#{i+1}. #{genre[1]} - #{genre[0]}" }
  end

  def play_song
    gets.chomp
    song_artist = {}
    Song.all.each do |song|
      song_artist[song.name] = song.artist.name
    end
    song_artist = song_artist.sort
    # binding.pry
    puts "Which song number would you like to play?"
    if gets.to_i <= Song.all.length && gets.to_i > 0
      puts "Playing #{song_artist[gets.to_i-1][0]} by #{song_artist[gets.to_i-1][1]}"
    end


    #  puts "Which song number would you like to play?"
    # list_songs
    # gets.chomp
    # library = Song.all.collect {|s| s.name}.sort
    # library[gets.to_i]
    # binding.pry


    # song_number = gets.to_i
    # song_library = Song.all.collect {|song| song.name}.sort
    # binding.pry
    # if song_number <= Song.all.length && song_number > 0
    #   puts "Playing #{song_library[song_number-1]}"

    # binding.pry
  end







end
