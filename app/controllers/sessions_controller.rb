class SessionsController < ApplicationController
  def new
  end

  def validate_user
    user = User.where(:username => params[:session][:email], :password => params[:session][:password]).first
    puts user
    if user
      redirect_to :controller => 'home', :action => 'index'
      return
    end
    flash[:alert] = "Invalid username or password"
    redirect_to :action => 'new'
  end
end
