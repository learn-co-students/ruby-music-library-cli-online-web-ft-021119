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
      elsif user_input == "list songs"
        self.list_songs
      elsif user_input == "list artists"
        self.list_artists
      elsif user_input == "list genres"
        self.list_genres
      elsif user_input == "list artist"
        self.list_songs_by_artist
      elsif user_input == "list genre"
        self.list_songs_by_genre
      elsif user_input == "play song"
        self.play_song
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

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    # # binding.pry
    # self.list_songs

# Collect all of a certain artist's songs:
    all_songs = Song.all
    your_artists_songs = all_songs.select {|song|
      if song.artist.name == user_input
        song
      end}
# Sort the songs by their names:
    sorted = your_artists_songs.sort_by { |song|
              song.name}

#Reformat songs using numbered list:
      final = sorted.map.with_index {|song,index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"      }
      final
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
    # # binding.pry
    # self.list_songs

# Collect all of a certain artist's songs:
    all_songs = Song.all
    your_genres_songs = all_songs.select {|song|
      if song.genre.name == user_input
        song
      end}
# Sort the songs by their names:
    sorted = your_genres_songs.sort_by { |song|
              song.name}

#Reformat songs using numbered list:
      final = sorted.map.with_index {|song,index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
          }
      final
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.chomp.to_i
# binding.pry
    if user_input.between?(1,Song.all.length)
      specific_song = Song.all.sort_by {|song| song.name}[user_input - 1]
      puts "Playing #{specific_song.name} by #{specific_song.artist.name}"
    else
      #{do nothing}
    end

  end

end
