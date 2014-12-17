class AccessController < ApplicationController

	before_filter :confirm_logged_in, only: :index
  def index
    @shop = session['shop_id']
  end

  def login
  	
  end

  def logout
  	session["shop_id"] = nil
  	flash[:notice] = "you have been logged out"
  	redirect_to  action: 'login' 
  end

   def attempt_login
   	user = Shop.find_by_username(params["username"]).try(:authenticate, params["password"])
   	if user
  		session["shop_id"] = user.id
  		flash[:notice] = "user successfully logged in"
  		redirect_to action: 'index'
  	else
  		flash[:notice] = "wrong username/password combination"
  		redirect_to action: 'login'
  	end
   end
end
