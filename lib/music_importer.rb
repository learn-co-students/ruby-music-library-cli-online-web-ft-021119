require 'pry'

class MusicImporter
  attr_accessor :path, :files

  def initialize(filepath)
    @path = filepath
    # binding.pry
    @files = Dir.entries(@path).keep_if{|item| item.end_with?(".mp3")}
  end


  def import
    @files.each do |song|
      Song.create_from_filename(song)
    end
    # binding.pry
  end


end
