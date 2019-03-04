# require_relative '../artist.rb'
# require_relative '../genre.rb'


module Concerns::Findable

  def find_by_name(name)
    match = nil
    self.all.each do |item|
      item.name == name ? match = item : nil
    end
    match
  end


  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

end
