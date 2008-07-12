class SessionsController < ApplicationController

  skip_before_filter :authenticate

  def new
    if params[:login]
      if user = User.find_by_login_and_password(params[:login], params[:password])
        session[:user] = user.id
        redirect_to session[:return_to]
      else
        flash[:error] = "The login/password combination is invalid"        
        flash.discard 
      end
    end
  end

  def destroy
    session[:user] = nil
    flash[:notice] = "You are now logged out"
    redirect_to root_url 
  end

end
