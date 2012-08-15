class HomeController < ApplicationController
  before_filter do
   authenticate_user! rescue redirect_to auth_url
  end
  
  before_filter :get_things, :only => [:list]
  def index
    @nohash = current_user.hashtag.nil?
  
  end
 
  
  
  def list
  	
  end
 protected
 def get_things
 email = current_user.email

 require 'net/http'
 require 'json'
 result = Net::HTTP.get(URI.parse('http://sleepy-oasis-7260.herokuapp.com/photos'))
 photos2 = JSON.parse result
 
 photos2.each do |photo2|
   url = photo2['url']
   id = photo2['_id']
   unless Photo.exists?([ "email = ? AND uid = ?", email, id])
   Photo.new(:uid => id, :url => url, :active => false, :email => email).save
  end
 end 
 
 	@photos = Photo.find(:all, :conditions => [ "email = ?", email])
 end 
 

end

