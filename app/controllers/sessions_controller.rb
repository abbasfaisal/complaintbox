class SessionsController < ApplicationController
	def new
		if session[:username]
			redirect_to :controller => 'home', :action => 'index'
			return
		end
	end

	def validate_user
    		user = User.where(:username => params[:session][:email], :password => params[:session][:password]).first
		if user
			session[:username] = user.username
			redirect_to :controller => 'home', :action => 'index'
			return
    		end
		flash[:alert] = "Invalid username or password"
		redirect_to :action => 'new'
	end

	def logout
		session[:username] = nil
		redirect_to '/login'
	end
end
