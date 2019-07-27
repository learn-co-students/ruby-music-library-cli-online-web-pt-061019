# module Concerns
#     module Findable

#         def find_by_name(name)
#             self.all.find {|x| x.name == name}
#         end

#         def self.find_or_create_by_name(name)
#             self.all.find {|x| x.name == name} || self.new(name)
#         end

#     end
# end