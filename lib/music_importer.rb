require 'pry'

#path
#=> "./spec/fixtures/mp3s"

class MusicImporter

    #attr_accessor :path #, :files
    attr_reader :path

    def initialize(path)
        @path = path
    end
     
  

    def files

Dir.glob("#{path}/*").map{ |file| file.gsub("#{path}/", '')}

          #Dir.glob("#{path}")
    #Dir.glob("#{path}/*")
#=> ["./spec/fixtures/mp3s/Jurassic 5 - What's Golden - hip-hop.mp3",
#    "./spec/fixtures/mp3s/Real Estate - It's Real - hip-hop.mp3",
#    "./spec/fixtures/mp3s/Real Estate - Green Aisles - country.mp3",
#    "./spec/fixtures/mp3s/Thundercat - For Love I Come - dance.mp3",
#    "./spec/fixtures/mp3s/Action Bronson - Larry Csonka - indie.mp3"]
    end

    # def import
    #     Song.create
    # end

    def import
        files.each{ |f| Song.create_from_filename(f) }
    end
end