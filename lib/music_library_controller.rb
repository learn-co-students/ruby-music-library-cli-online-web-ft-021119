require 'pry'
class MusicLibraryController
  attr_accessor :path 
  def initialize(path="./db/mp3s") #path = "./spec/fixtures/mp3s" 
    @path = path 
    new = MusicImporter.new(path)
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
    answer = nil
    until answer == "exit"
      answer = gets.strip
      if answer == "list songs"
        list_songs 
      elsif answer == "list artists"
        list_artists
      elsif answer == "list genres"
        list_genres
      elsif answer == "list artist"
        list_songs_by_artist
      elsif answer == "list genre"
        list_songs_by_genre
      elsif answer == "play song"
        play_song
      end
    end
  end 
  
  def list_songs
   Song.all.sort {|a,b| a.name <=> b.name}.each_with_index do |element, index|
      puts "#{index+1}. #{element.artist.name} - #{element.name} - #{element.genre.name}"
    end
  end
  def list_artists 
    Artist.all.sort {|a,b| a.name <=> b.name}.each_with_index do |element, index|
      puts "#{index+1}. #{element.name}"
    end
  end 
  def list_genres 
    Genre.all.sort {|a,b| a.name <=> b.name}.each_with_index do |element, index|
      puts "#{index+1}. #{element.name}"
    end
  end 
  
  def list_songs_by_artist 
    puts "Please enter the name of an artist:"
    answer = gets.strip
    if artist = Artist.find_by_name(answer)
      artist.songs.sort {|a,b| a.name <=> b.name}.each_with_index do |element, index|
        puts "#{index+1}. #{element.name} - #{element.genre.name}"
      end
    end 
  end 
  def list_songs_by_genre 
    puts "Please enter the name of a genre:"
    answer = gets.strip
    if genre = Genre.find_by_name(answer)
       genre.songs.sort {|a,b| a.name <=> b.name}.each_with_index do |element, index|
        puts "#{index+1}. #{element.artist.name} - #{element.name}"
      end
    end
  end 
  def play_song
    puts "Which song number would you like to play?"
    answer = gets.strip.to_i   #answer = 4
      if 1 < answer && answer < Song.all.length
        song = Song.all.sort{ |a, b| a.name <=> b.name }[answer - 1]
        puts "Playing #{song.name} by #{song.artist.name}" 
      else 
    end 
  end
end