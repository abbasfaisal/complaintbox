class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def authorize
    unless session[:username]
      redirect_to :controller => 'sessions', :action => 'new', alert: "Please log in"
    end
  end

end
