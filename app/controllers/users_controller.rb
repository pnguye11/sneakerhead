class UsersController < ApplicationController
def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to shoes_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(current_user)
  end

  def update
    @user = User.find(current_user)
    if @user.save
      @user.update user_params
      redirect_to shoes_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @user.destroy
    current_user = nil
    redirect_to shoes_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_name)
  end
end



