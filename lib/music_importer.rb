require 'pry'
class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
    mp3s = Dir.glob("#{path}/*.mp3")
    mp3s.map do |element|
      element.slice!("#{path}/")
    end
    mp3s
  end 
  def import
    array = self.files
    array.map do |individual_file|
      Song.create_from_filename(individual_file)
    end 
  end
end