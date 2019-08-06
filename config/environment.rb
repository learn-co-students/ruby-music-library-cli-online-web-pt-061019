require 'bundler'
Bundler.require

module Concerns
  module Findable
  def find_by_name(name)
      all.find do |x| x.name == name
      end
  end

end
end
require_all 'lib'
