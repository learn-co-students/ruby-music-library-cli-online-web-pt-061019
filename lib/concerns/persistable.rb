module Persistable
  module ClassMethods
    def self.destroy_all
      self.all.clear
    end
  end

module InstanceMethods
  def self.save
    self.class.all << self
    end
  end
end