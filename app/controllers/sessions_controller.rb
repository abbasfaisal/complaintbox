class SessionsController < ApplicationController
  def new
  end

  def validate_user
    puts "\n\n\nI am here\n\n\n"
    user = User.where(:username => params[:session][:email], :password => params[:session][:password]).first
    puts "\n\n\n\n\nafasdfds"
    puts user
    if user
      redirect_to :controller => 'home', :action => 'index' if user
      return
    end
    flash[:alert] = "Invalid user/password combination"
    redirect_to :action => 'new'
  end
end
