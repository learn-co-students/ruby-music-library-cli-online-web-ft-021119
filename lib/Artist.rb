
require_relative './concerns.rb'
require 'pry'

class Artist
attr_accessor :name, :song, :genre
extend Concerns::Findable


@@all =[]
		def initialize(name)
			@name = name
			
			@songs = []
			
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
		def self.create(artists)
			#binding.pry
			new_artist = self.new(artists)
			@@all << new_artist
			new_artist
		end 
		def songs
			@songs
			#binding.pry
		end


		def add_song(song)
			#binding.pry
			
				if song.artist == nil
			song.artist = self
			elsif !self.songs.include?(song)
				@songs << song
			end
				#self.songs << Song.all
				#binding.pry


		end

		def genres
			songs.map {|song|song.genre}.uniq
			end


end