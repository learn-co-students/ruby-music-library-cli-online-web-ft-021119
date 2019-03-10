module Concerns::Findable
  def find_by_name(name)
    self.all.each {|element| return element if element.name == name}
    return nil
  end
  
  def find_or_create_by_name(name)
    return self.find_by_name(name) if self.find_by_name(name) != nil
    self.create(name)
  end
end