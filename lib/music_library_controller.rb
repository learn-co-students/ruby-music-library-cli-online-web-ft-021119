require 'pry'
class MusicLibraryController
  def initialize(file_path = './db/mp3s')
    new = MusicImporter.new(file_path)
    new.import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = ""
    while input != "exit"
      input = gets.chomp
      list_songs if input == "list songs"
      list_artists if input == "list artists"
      list_genres if input == "list genres"
      list_songs_by_artist if input == "list artist"
      list_songs_by_genre if input == "list genre"
      play_song if input == "play song"
    end
  end
  
  def list_songs
    Song.all.sort{|a, b| a.name <=> b.name}.each_with_index {|element, index| puts "#{index + 1}. #{element.artist.name} - #{element.name} - #{element.genre.name}"}
  end
  
  def list_artists
    Artist.all.sort{|a, b| a.name <=> b.name}.each_with_index {|element, index| puts "#{index + 1}. #{element.name}"}
  end
  
  def list_genres
    Genre.all.sort{|a, b| a.name <=> b.name}.each_with_index {|element, index| puts "#{index + 1}. #{element.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    Artist.find_by_name(input).songs.sort{|a, b| a.name <=> b.name}.each_with_index {|element, index| puts "#{index + 1}. #{element.name} - #{element.genre.name}"} if Artist.find_by_name(input) != nil
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    Genre.find_by_name(input).songs.sort{|a, b| a.name <=> b.name}.each_with_index {|element, index| puts "#{index + 1}. #{element.artist.name} - #{element.name}"} if Genre.find_by_name(input) != nil
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp
    Song.all.sort{|a, b| a.name <=> b.name}.each_with_index {|element, index| puts "Playing #{element.name} by #{element.artist.name}" if (index + 1).to_s == input}
  end
end