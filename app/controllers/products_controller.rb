class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit, :update]
  before_action :set_product, only: [:show,:edit, :update] #多分後でいる, :destroy

  def index
    @products = Product.all.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end



  def product_params
    params.require(:product).permit(:name, :introduction, :category_id, :status_id, :sent_fee_id, :sent_area_id, :arrival_period_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end



end
