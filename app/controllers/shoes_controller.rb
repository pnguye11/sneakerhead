class ShoesController < ApplicationController
  before_action :set_shoe, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @shoes = Shoe.all
  end

  def show
  end

  # GET /shoes/new
  def new
    @shoe = current_user.shoes.build
  end

  # GET /shoes/1/edit
  def edit
  end

  # POST /shoes

  def create
    @shoe = current_user.shoes.build(shoe_params)
      respond_to do |format|
      if @shoe.save
        format.html { redirect_to @shoe, notice: 'Shoe was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /shoes/1
  def update
    respond_to do |format|
      if @shoe.update(shoe_params)
        format.html { redirect_to @shoe, notice: 'Shoe was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /shoes/1
  def destroy
    @shoe.destroy
    respond_to do |format|
      format.html { redirect_to shoes_url, notice: 'Shoe was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shoe
      @shoe = Shoe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shoe_params
      params.require(:shoe).permit(:size, :name, :brand, :price, :condition, :color, :notes, :image)
    end

    def correct_user
      @shoe = current_user.shoes.find_by(id: params[:id])
      redirect_to shoes_path, notice: "C'mon brah, don't stuff other people's stuff" if @shoe.nil?
    end
end
