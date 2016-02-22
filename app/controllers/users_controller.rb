class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
@user = User.new(user_params)
    if @user.save 
      redirect_to root_url 
      flash[:success] = "You have successfully signed up."

    else 
      render "new"
    end
  end
  
  def edit 
    @user = User.find(params[:id])
  end
  def update 
    @user = User.find_by(id: params[:id])
   
    if @user.update_attributes(user_params)
      redirect_to "/users/#{@user.id}"
    else
      render 'edit'
    end
  end
  def show 
    @user = User.find(params[:id])
  end
  def destroy
    @user = User.find_by_id(params['id'])
    @user.destroy
    redirect_to "/users"
  end
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end
  
end
