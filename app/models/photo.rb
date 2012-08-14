class Photo < ActiveRecord::Base
  attr_accessible :active, :expires, :url
end
