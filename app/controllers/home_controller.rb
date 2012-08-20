class HomeController < ApplicationController
  before_filter do
   authenticate_user! rescue redirect_to auth_url
  end
  
  before_filter :get_things, :only => [:list, :moderate]
  def index
    @nohash = current_user.hashtag.nil?
  end
 
  
  
  def list
  	
  end
  
  def moderate
  end
  
  def change
    if request.xhr?
      
      id = params[:id]
      what = params[:what]
      photo = Photo.find(:first, :conditions => ["id = ?",id])
      puts what
      
      if what == "ok"
        photo.active = true      
        photo.save
      elsif what == "des"
        photo.active = false
        photo.save
        
      elsif what == "delete"
        photo.deleted = true
        photo.save
      end
    
    end
    
    
   render :json => {'status' => 'success'}
    
    
  end
  
  protected
  
  def get_things
   email = current_user.email
   hashtag = current_user.hashtag
   pwd = md5("xande");
   require 'net/http'
   require 'json'
   result = Net::HTTP.get(URI.parse('http://localhost:9000/'+hashtag+'/photos/'+pwd))
   photos2 = JSON.parse result
 
   photos2.each do |photo2|
     url = photo2['url']
     id = photo2['_id']
     unless Photo.exists?([ "email = ? AND uid = ?", email, id])
     Photo.new(:uid => id, :url => url, :active => false, :email => email, :deleted => false).save
     end
   end 
  @photos = Photo.find(:all, :conditions => [ "email = ? AND deleted = ?", email, 'f'], :order => :id )
  @phot2os = Photo.find(:all, :conditions => [ "email = ? AND active = ? AND deleted = ?", email, 't','f'], :order => :updated_at)
 end 
 
 def md5(valor)
 Digest::MD5.hexdigest valor
 end

end

