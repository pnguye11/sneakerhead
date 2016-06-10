class ShoesController < ApplicationController
  # before_action :set_shoe, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:index, :show]
  def index
    @shoes = Shoe.all
    @shoe = Shoe.new
  end

  def show
    @shoe = Shoe.find(params[:id])
    @user = @shoe.user
  end
  def new
    @user = User.find(params[:user_id])
    @shoe = @user.shoes.new
  end

  def create
    @user = User.find(params[:user_id])
    @shoe = @user.shoes.new(shoe_params)
    if @shoe.save
      redirect_to user_path(@user.id), notice: "Your kicks has been created brah!"
    else
      render :new, alert: "Your new post couldn't be created!"
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @shoe = Shoe.find(params[:id])
  end

  def update
    @shoe = Shoe.find(params[:id])
    if @shoe.update_attributes(shoe_params)
      flash[:success] = "Updated"
      redirect_to user_path(@shoe.user)
    else
      flash.now[:alert] = "Update failed!"
      render :edit
    end
  end

  def destroy
    @shoe = Shoe.find(params[:id])
    redirect_to user_path
  end

  private

  def shoe_params
    params.require(:shoe).permit(:image, :size, :name, :brand, :price, :condition, :color, :notes)
  end

  def set_shoe
    @shoe = Shoe.find(params[:id])
  end
end
