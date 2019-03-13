require 'pry'
class MusicLibraryController
  def initialize(path = './db/mp3s') #path = ./db/mp3s/
    @path = path
    new_importer = MusicImporter.new(@path)
    @filenames = new_importer.import
  end

  def call
    4.times do
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
      if user_input == "exit"
        return "Goodbye!"
      end
    end
  end

  def list_songs
# Sorting songs by their names
    song_list = Song.all.sort_by { |song| song.name}

# Formatting into a numbered list
    formatted = song_list.map.with_index{ |song,index|
      # binding.pry
    puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  # binding.pry
}
    # binding.pry
    formatted
  end

  def list_artists
    artist_list = Artist.all.sort_by {|artist| artist.name}
    formatted = artist_list.map.with_index {|artist,index|
      puts "#{index+1}. #{artist.name}"    }
    formatted
  end

  def list_genres
    genre_list = Genre.all.sort_by {|genre| genre.name}
    formatted = genre_list.map.with_index {|genre,index|
      puts "#{index+1}. #{genre.name}"    }
    formatted
  end

end
