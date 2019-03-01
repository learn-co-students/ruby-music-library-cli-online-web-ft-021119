module Concerns::Findable
  def create(name)
    song = self.new(name)
    all << song
    song
  end

  def find_by_name(name)
    all.find{|song| song.name == name}
  end

  def find_or_create_by_name(name)
    if find_by_name(name) == nil
      create(name)
    else
      find_by_name(name)
    end
  end
end
