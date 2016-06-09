class ShoesController < ApplicationController
  before_action :set_shoe, only: [:show, :edit, :update, :destroy]
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
    @shoe = Shoe.new
  end

  def create
    @shoe = Shoe.new shoe_params
    if @shoe.save
      current_user.shoes << @shoe
      flash[:success] = "Your kicks has been created brah!"
      redirect_to root_path
    else
      flash.now[:alert] = "Your new post couldn't be created!"
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @shoe = Shoe.find(params[:id])
  end

  def update
    if @shoe.update(shoe_params)
      flash[:success] = "Updated"
      redirect_to root_path
    else
      flash.now[:alert] = "Update failed!"
      render :edit
    end
  end

  def destroy
    @shoe.destroy
    redirect_to root_path
  end

  private

  def shoe_params
    params.require(:shoe).permit(:image, :size, :name, :brand, :price, :condition, :color, :notes)
  end

  def set_shoe
    @shoe = Shoe.find(params[:id])
  end
end
