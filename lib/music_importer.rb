require 'pry'

class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(@path).reject {|i|  i == "." || i == ".." }
  end

  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end


end
