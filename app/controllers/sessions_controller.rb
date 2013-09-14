class SessionsController < ApplicationController

	force_ssl

	def create
	  user = User.authenticate(params[:username], params[:password])
	  if user
	    session[:user_id] = user.id
	    flash[:success] = "Successfully Logged in"
	    redirect_to root_url
	  else
	  	flash.now[:error] = "Invalid username/password"
	    render :new
	  end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Logged out"
	end

end
