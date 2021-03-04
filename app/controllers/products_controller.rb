class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end



  def product_params
    params.require(:product).permit(:name, :introduction, :category_id, :status_id, :sent_fee_id, :sent_area_id, :arrival_period_id, :price, :image).merge(user_id: current_user.id)
  end





end
