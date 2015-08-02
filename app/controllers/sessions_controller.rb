class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
      flash[:message] = "You have Logged in!"
    else
      flash[:message] ="Email or password is invalid!"
      render "new"
    end
  end
end
