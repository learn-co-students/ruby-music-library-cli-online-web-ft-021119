require 'pry'
class MusicImporter
  attr_accessor :path, :array
  
  def initialize(file_path)
    @path = file_path
  end
  
  def files
    d = Dir.new(@path)
    @array = []
    d.each {|element| @array << element if element.include?("mp3")}
    @array
  end
  
  def import
    files
    @array.each {|element| Song.create_from_filename(element)}
  end
end