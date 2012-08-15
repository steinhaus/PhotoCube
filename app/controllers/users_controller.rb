class UsersController < ApplicationController
before_filter do
 authenticate_user! rescue redirect_to auth_url
end

def edithashtag
@user = current_user
end

def update
  @user = User.find(params[:id])
  
  if @user.update_attributes(params[:user])
  redirect_to :controller => 'home', :action => 'index'
  end
end

end