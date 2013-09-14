class ApplicationController < ActionController::Base

  protect_from_forgery 
  
  #rescue_from Exception, with: :show_errors
   
  helper_method :current_user
  
  def routing_error
  	raise ActionController::RoutingError.new(params[:path])
  end	

private

	def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def show_errors(exception)
		case exception
			when ActionController::RoutingError 
				render :text=>'Oops!!!! Page does not exist', :status=>404
			when ActiveRecord::RecordNotFound
				render :text=>'Sorry!!!!! Record does not exist', :status=>500
		end			
	end

end
