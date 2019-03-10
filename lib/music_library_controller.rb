class MusicLibraryController


			def initialize(path = "./db/mp3s")
				@path = path
				import_object = MusicImporter.new(path)
				import_object.import
			end

			def call
					
					input = ""
					while input != "exit"
						puts "Welcome to your music library!"
					puts "To list all of your songs, enter 'list songs'."
					puts "To list all of the artists in your library, enter 'list artists'."
					puts "To list all of the genres in your library, enter 'list genres'."
					puts "To list all of the songs by a particular artist, enter 'list artist'."
					puts "To list all of the songs of a particular genre, enter 'list genre'."
					puts "To play a song, enter 'play song'."
					puts "To quit, type 'exit'."
					puts "What would you like to do?"
					input = gets.chomp

					case input
			when "list songs"
				list_songs
			when "list artists"
			   	list_artists
			when "list genres"
			   	list_genres
			when "list artist"
			    list_songs_by_artist
			when "list genre"
			   list_songs_by_genre
			when "play song"
			   	play_song
			
			
			end
				

			end
		end

				



				def list_songs
					# song_list = []
					counter = 1
					#binding.pry
					sorted_songs = Song.all.sort_by do |song|
						#binding.pry
						song.name
					end
					

							#binding.pry
					sorted_songs.each do |song|
						

						puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
						# sentence = "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
						# song_list << sentence
						counter += 1
				
				#binding.pry
				end
				#sorted_songs
				#binding.pry
			end
			



			def list_artists
			
				counter = 1
				#binding.pry
					sorted_artists = Artist.all.sort_by do |artist|
						#binding.pry
						artist.name
				end
			
				sorted_artists.uniq.each do |artist|
				#binding.pry
				


				puts "#{counter}. #{artist.name}"
						
				counter += 1
				end
			end

			def list_genres
			
				counter = 1
				#binding.pry
				sorted_genres = Genre.all.sort_by do |genre|
				#binding.pry
				genre.name
				end
		
				sorted_genres.uniq.each do |genre|
			 	#binding.pry
				


				puts "#{counter}. #{genre.name}"
						
				counter += 1
				end
			end

			def list_songs_by_artist
				counter = 1 
				puts "Please enter the name of an artist:"
				user_input = gets.strip
				if artist = Artist.find_by_name(user_input)
					#binding.pry
				songs_of_artist_sorted = artist.songs.sort_by do |songs|
					#binding.pry
					songs.name
				end
				songs_of_artist_sorted.each do |songs|
					#binding.pry
					puts "#{counter}. #{songs.name} - #{songs.genre.name}"
					counter += 1
				# 	songs.name
				# 	songs.genre.name
				# binding.pry
				end
			end
			end

			def list_songs_by_genre
			 	counter = 1 
			 	puts "Please enter the name of a genre:"
			 	user_input = gets.strip
			 	if genre = Genre.find_by_name(user_input)
				#binding.pry
				genres_of_artist_sorted = genre.songs.sort_by do |songs|
			 	#binding.pry
			 		songs.name
			 	end
					


			 	
				genres_of_artist_sorted.each do |songs|
					#binding.pry
					puts "#{counter}. #{songs.artist.name} - #{songs.name}"
					counter += 1
				# 	songs.name
				# 	songs.genre.name
				# binding.pry
				end
			 end
			end
			def play_song
				 puts "Which song number would you like to play?"
				 user_input = gets.strip.to_i
				 sorted_list  = Song.all.sort_by do |songs|
				 		#binding.pry
				 		songs.name
					 end
					 #sorted_list = sorted_list.uniq!
								if user_input > 0 && user_input <= sorted_list.length
								current_song = sorted_list[user_input - 1]
								puts "Playing #{current_song.name} by #{current_song.artist.name}"
							 end



							#  until (user_input > 0 && user_input <= sorted_list.length)
							#	user_input
							#  else 
							#  	urrent_song = sorted_list[user_input + 2]
							# 	puts "Playing #{current_song.name} by #{current_song.artist.name}"
							# end
							 	end

			
		
				
			  		
			

end 
#class end