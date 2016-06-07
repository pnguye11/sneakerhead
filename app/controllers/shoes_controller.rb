class ShoesController < ApplicationController
  def new
    @shoes = Shoe.new
  end
end
