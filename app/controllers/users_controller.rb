class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find_by_id(params[:id])
    unless current_user == @user
       flash.now.alert =
        "C'mon bro stick to your own profile!"
      redirect_to user_path
    end
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully signed up!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end
  def destroy
     user = current_user
     if user.destroy
      session[:user_id] = nil
      redirect_to root_path, notice: "Why you bounc'in??"
     else
      flash.now.alert ="That's right!"
      redirect_to root_path
    end
 end
 private
  def authenticate
    unless logged_in?
      flash.now.alert =
        "You must be logged in to access this section of the site."
      redirect_to login_path
    end
  end
  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_name)
    end
end
