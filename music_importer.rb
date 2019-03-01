require_all 'lib'

class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries(@path).keep_if{|file| file.end_with?('.mp3')}
  end

end
