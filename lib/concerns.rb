module Concerns::Findable


		def find_by_name(song)
	    		self.all.find do |songs|
	    		#binding.pry
	    		songs.name == song
				end
		end

		def find_or_create_by_name(songs)
           
            if self.find_by_name(songs) == nil
            	self.create(songs)
 			else
            	 self.find_by_name(songs)
            end
		#binding.pry
		end
end