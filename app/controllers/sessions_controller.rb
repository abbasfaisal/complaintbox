class SessionsController < ApplicationController
	def new
		if session[:username]
			redirect_to '/home'
			return
		end
#	render :layout => false
	end

	def validate_user
    		user = User.where(:username => params[:session][:email], :password => params[:session][:password]).first
		if user
			session[:username] = user.username
			redirect_to :controller => 'home', :action => 'index'
			return
    		end
		redirect_to :action => 'new', alert: "Invalid username or password"
	end

	def logout
		session[:username] = nil
		redirect_to '/login'
	end
end
