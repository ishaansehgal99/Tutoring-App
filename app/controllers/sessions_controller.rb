class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/start'
      flash[:success] = "You have Logged in!"
    else
      flash[:danger] = 'Invalid email/password combination'
      render "new"
    end
  end
  def destroy
     # Logs out the current user.
    log_out
    redirect_to root_url
  end
end
