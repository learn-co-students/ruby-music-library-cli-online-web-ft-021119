require 'pry'

class MusicImporter
  attr_accessor :path, :files

  def initialize(file_path) #"./spec/fixtures/mp3s" ... string
    @path = file_path
    #binding.pry
  end

  def files
    @files = Dir.entries(@path).reject {|i|  i == "." || i == ".." }
  end


end
