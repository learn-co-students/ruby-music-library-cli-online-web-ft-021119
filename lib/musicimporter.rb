require "pry"

class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    files = Dir.entries(@path)
    mp3_files = []

    files.each do |file_name|
      if file_name.end_with?(".mp3")
        mp3_files << file_name
      end
    end
    mp3_files
  end

  def import
    files.each do |file_name|
      Song.create_from_filename(file_name)
    end
  end
end
