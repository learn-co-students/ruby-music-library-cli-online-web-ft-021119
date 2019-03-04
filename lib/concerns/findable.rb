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


end
