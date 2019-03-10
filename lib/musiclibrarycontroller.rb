require 'pry'
class MusicLibraryController
extend Concerns::Findable

  def initialize(path = "./db/mp3s")
    object = MusicImporter.new(path)
    object.import
  end

  def call
      until @user_input == "exit"
        puts "Welcome to your music library!"
        puts  "To list all of your songs, enter 'list songs'."
        puts  "To list all of the artists in your library, enter 'list artists'."
        puts  "To list all of the genres in your library, enter 'list genres'."
        puts  "To list all of the songs by a particular artist, enter 'list artist'."
        puts  "To list all of the songs of a particular genre, enter 'list genre'."
        puts  "To play a song, enter 'play song'."
        puts  "To quit, type 'exit'."
        puts  "What would you like to do?"
        @user_input = gets.chomp.downcase
          case @user_input
          when "list songs"
            list_songs
          when "list artists"
            list_artists
          when "list genres"
            list_genres
          when "list artist"
            list_artist
          when "list genre"
            list_genre
          when "play song"
            play_song
          else
            call
          end
      end
  end

  def list_songs
    @all_songs = Song.all
    all_songs_by_name = @all_songs.sort_by do |song|
      song.name
    end
    all_songs_by_name.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist} - #{song.name} - #{song.genre.name}"
      # binding.pry
    end
  end
  # Song.all.sort {|a, b| a.name <=> b.name}.each.with_index(1) do |song, i|
# end
