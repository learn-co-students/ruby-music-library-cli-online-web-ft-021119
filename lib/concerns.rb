module Concerns::Findable
  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end  
  def find_by_name(name)
    all.find {|song_instance| song_instance.name == name}
  end 
end