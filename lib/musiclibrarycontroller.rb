require "pry"

class MusicLibraryController
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    loop do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      user_input = gets.chomp
      if user_input == "list songs"
        list_songs
      elsif user_input == "list artists"
        list_artists
      elsif user_input == "list genres"
        list_genres
      elsif user_input == "list artist"
        list_songs_by_artist
      elsif user_input == "list genre"
        list_songs_by_genre
      elsif user_input == "play song"
        play_song
      end

      break if user_input == "exit"
    end
  end

  def list_songs
    sorted_songs = Song.all.sort_by{|song| song.name}
    sorted_songs.uniq!
    sorted_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    sorted_songs
  end

  def list_artists
    sorted_artists = Artist.all.sort_by{|artist| artist.name}
    sorted_artists.uniq!
    sorted_artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    sorted_genres = Genre.all.sort_by{|genre| genre.name}
    sorted_genres.uniq!
    sorted_genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    if Artist.find_by_name(user_input) != nil
      artist = Artist.find_by_name(user_input)

      sorted_songs = artist.songs.sort_by{|song| song.name}
      sorted_songs.uniq!
      sorted_songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
    if Genre.find_by_name(user_input) != nil
      genre = Genre.find_by_name(user_input)

      sorted_songs = genre.songs.sort_by{|song| song.name}
      sorted_songs.uniq
      sorted_songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.chomp
    sorted_songs = Song.all.sort_by{|song| song.name}
    sorted_songs.uniq!
    if user_input.to_i >= 1 && user_input.to_i <= Song.all.size
      song_choice = sorted_songs[user_input.to_i - 1]
      unless song_choice == nil
        puts "Playing #{song_choice.name} by #{song_choice.artist.name}"
      end
    end
  end

end
