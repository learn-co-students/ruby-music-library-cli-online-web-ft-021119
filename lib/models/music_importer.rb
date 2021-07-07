class MusicImporter
  
  attr_accessor :path
  
  def initialize(filepath)
    @path = filepath
  end 
  
  def files
    file_array = Dir["#{self.path}//**/*.mp3"]
    file_array.map {|filename| filename.slice!(self.path+"//")}
    file_array
  end
  
  def import 
    files.each {|filename| Song.create_from_filename(filename)}
  end 
  
end 