module Concerns 
  module Findable 
    # def all 
    #   @@all
    # end
    
    # def destroy_all  
    #   self.all.clear
    # end
    
    def create(name) 
      object = Class.new(name)
      objct.save
      object
    end
    
    def find_by_name(name) 
      self.all.find {|object| object.name == name}
    end
    
    def find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end
  end
end