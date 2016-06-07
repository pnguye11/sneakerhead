class ShoesController < ApplicationController
  def new
    @shoe = Shoe.all
  end
def create
    if @shoe = shoe.create(shoe_params)
      flash[:success] = "Your kicks has been created brah!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Your new post couldn't be created!"
      render :new
    end
  end
  def edit
  end

  def update
    if @shoe.update(shoe_params)
      flash[:success] = "Updated"
      redirect_to posts_path
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
    params.require(:shoe).permit(:image, :caption)
  end

  def set_post
    @shoe = Post.find(params[:id])
  end
end
