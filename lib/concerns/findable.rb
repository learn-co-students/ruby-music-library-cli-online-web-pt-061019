module Concerns::Findable

    def find_by_name(name)
        all.detect{|x| x.name == name}
    end

    def find_or_create_by_name(name)
        item = find_by_name(name)
        if !item
            item = create(name)
        end
        item
    end

end
