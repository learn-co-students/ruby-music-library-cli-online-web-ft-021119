
require 'pry'
class Song

	@@all = []

	attr_accessor :name, :artist, :genre

		def initialize(name, artist = nil, genre = nil)

			@name = name
		 	
		   self.artist = artist if artist != nil
			# @genre = genre
		 	self.genre = genre if genre != nil
		 
			#@@all = []

			#sbinding.pry

		end

		def self.all
			@@all
		end

		def self.destroy_all
			@@all =[]
		end

		def save
			@@all << self
		end

		def self.create(songs)
			#binding.pry
			song = Song.new(songs)
			@@all << song
			song

 
		end
		 def artist=(artist)
			#binding.pry
		    @artist = artist
		    self.artist.add_song(self)
 	 	end

 	  	def genre=(genre)
			 #binding.pry
			 @genre = genre
			 self.genre.add_song(self)
			 #binding.pry

 		end

 		def self.find_by_name(song)
    	
    	
    		@@all.find do |songs|
    			#binding.pry
    			
    		 songs.name == song

				end
    
		end

		def self.find_or_create_by_name(songs)
           
       
            if self.find_by_name(songs) == nil
            	self.create(songs)
 			else
            	 self.find_by_name(songs)
            end


				#binding.pry
		end

		def self.new_from_filename(file)
		#binding.pry
			list_arr = file.split(" - ")
			song_name = list_arr[1]
			singer_name = list_arr[0]
			genre = list_arr[2].chomp(".mp3")
			new_song = self.find_or_create_by_name(song_name)
		    new_song.artist = Artist.find_or_create_by_name(singer_name)
			new_song.genre = Genre.find_or_create_by_name(genre)
			new_song
			#binding.pry
		end
		def self.create_from_filename(file)
			#binding.pry
			

       song = self.new_from_filename(file)
       
       #@@all << song


		end


end



















