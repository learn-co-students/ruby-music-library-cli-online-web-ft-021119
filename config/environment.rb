require 'bundler'
require 'pry'
Bundler.require

module Concerns
  module Findable
    def find_by_name(name)
      self.all.find do |i|
        i.name == name
      end
    end

    def find_or_create_by_name(name)
        if (self.find_by_name(name) != nil) == true
            self.find_by_name(name)
        else
            self.create(name)
        end
    end
  end
end

require_all 'lib'
