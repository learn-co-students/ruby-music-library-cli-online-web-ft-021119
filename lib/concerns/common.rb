require 'pry'

module Common
  module InstanceMethods
  #--------Start of Instance Methods-------
    def save
      self.class.all << self
    end
  end

  module ClassMethods

    def destroy_all
      self.all.clear
    end

    def create(name)
      instance = self.new(name)
      instance.save
      instance
    end
  end
end
