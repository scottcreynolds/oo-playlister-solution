module Memorable
  module InstanceMethods
    def initialize
      self.class.all << self
    end
  end

  module ClassMethods
    def self.extended(base)
      base.reset_all
    end

    def reset_all
      # Why use a class instance variable (@all)
      # vs.
      # a class (@@all) variables? 
      @all = []
    end

    def count
      self.all.size
    end

    def all
      @all
    end
  end
end
