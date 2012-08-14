class HomeController < ApplicationController
  before_filter do
   authenticate_user! rescue redirect_to auth_url
  end
  
  def index
  @nohash = current_user.hashtag.nil?
  
  end
 
  
  
  def list
  end
 

end

