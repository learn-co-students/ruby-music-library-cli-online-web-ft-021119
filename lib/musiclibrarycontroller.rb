class MusicLibraryController
# extend Concerns::Findable

  def initialize(path = "./db/mp3s")
    object = MusicImporter.new(path)
    object.import
  end

  # def call
  #   puts "Welcome to your music library!"
  #     user_input = ''
  #     while user_input != exit!
  #       puts  "What would you like to do?"
  #       user_input = gets.chomp
  #       # case user_input
  #       # when 'list songs'
  #       #   list_songs
  #       # when 'list artists'
  #       #   list_artists
  #       # when 'list genres'
  #       #   list_genres
  #       # when 'list artist'
  #       #   list_artist
  #       # when 'list genre'
  #       #   list_genre
  #       # when 'play song'
  #       #   play_song
  #     # end
  #   end
  end



end
