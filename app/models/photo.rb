class Photo < ActiveRecord::Base
  
  attr_accessible :active, :uid, :url, :email, :deleted
end
