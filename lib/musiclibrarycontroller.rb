class MusicLibraryController
extend Concerns::Findable

  def initialize(path = "./db/mp3s")
    object = MusicImporter.new(path)
    object.import
  end

  def call
   puts "Welcome to your music library!"
      user_input = ""
       while user_input != "exit!"
        puts  "What would you like to do?"
        puts  "To list all of your songs, enter 'list songs'."
        puts  "To list all of the artists in your library, enter 'list artists'."
        puts  "To list all of the genres in your library, enter 'list genres'."
        puts  "To list all of the songs by a particular artist, enter 'list artist'."
        puts  "To list all of the songs of a particular genre, enter 'list genre'."
        puts  "To play a song, enter 'play song'."
        puts  "To quit, type 'exit'."
          user_input = gets.chomp
          case user_input
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
        end
     end
  end

  def list_songs

  end


end
