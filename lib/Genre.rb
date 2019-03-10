
require_relative './concerns.rb'
require 'pry'

class Genre

	attr_accessor :name, :songs, :artist
@@all = []
		
 extend Concerns::Findable
		def initialize(name)
			@name = name
			
			@songs =[]

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
		def self.create(genres)
			new_genre = self.new(genres)
			@@all << new_genre
			new_genre
		end
		def add_song(song)
			#binding.pry
			
			if song.genre == nil
			song.genre = self
			elsif !self.songs.include?(song)
				@songs << song
			end
		end


	def artists
    songs.collect{|song|song.artist}.uniq
end

					

		
	


		
	
end