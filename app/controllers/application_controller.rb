class ApplicationController < ActionController::Base
  protect_from_forgery


  protected

  def confirm_logged_in
  	unless session["shop_id"]
  		flash[:notice] = "please use your username/password to log in and see the requested page"
  		redirect_to  controller: 'access', action: 'login'
  		return false
  	else
  		return true
  	end
  end

  def sid
    return session["shop_id"]
  end
end
