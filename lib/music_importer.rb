
require 'pry'
class MusicImporter
attr_accessor :path

		def initialize(path)
			@path = path
		end

		def files
			the_files = Dir.glob("#{path}/*mp3")
			the_files.collect do |each_file|
				
				each_file.gsub("#{path}/", "")
				end
			end

			def import
				
				files.each do |file|
					Song.create_from_filename(file)
				end

			end


end