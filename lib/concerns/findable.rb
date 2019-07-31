module Concerns
  module Findable

    def find_by_name(name)
      all.find {|s| s.name == name}
    end

    def find_or_create_by_name(name)
      find_by_name(name) == nil ? create(name) : find_by_name(name)
    end
  end
end
