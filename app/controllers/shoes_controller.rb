class ShoesController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy, ]
  before_action :set_shoe, only: [:show, :like]
  def index
    @shoes = Shoe.all
  end

  def show
    @shoe = Shoe.find(params[:id])
  end

  # like belongs to user
  def like

    @like = @shoe.likes.build(user_id: current_user.id)
      if @like.save
        flash[:notice] = "You liked this shoe!"
        redirect_to shoes_path
      else
        flash[:notice] = "You already liked this shoe!"
        redirect_to shoes_path
      end
  end

  def new
    @shoe = Shoe.new
  end

  def edit
    @shoe = Shoe.find(params[:id])
  end

  def create
    @shoe = Shoe.new shoe_params
    if @shoe.save
      if current_user
        current_user.shoes << @shoe
      end
      redirect_to shoe_path(@shoe.id)
    else
      render 'new'
    end
  end

  def update
    @shoe = Shoe.find(params[:id])
    if @shoe.save
      @shoe.update(shoe_params)
      redirect_to shoes_path
    else
      render 'edit'
    end
  end

  def destroy
    @shoe = Shoe.find(params[:id])
    @shoe.destroy
    redirect_to shoes_path
  end

  private

    def set_shoe
      @shoe = Shoe.find_by(params[:id])

    end

    def shoe_params
      params.require(:shoe).permit(:size, :name, :brand, :price, :condition, :color, :notes, :image, :likes)
    end

    def correct_user
      @shoe = current_user.shoes.find_by(id: params[:id])
      redirect_to shoes_path, notice: "C'mon brah, don't touch other people's stuff" if @shoe.nil?
    end
end
