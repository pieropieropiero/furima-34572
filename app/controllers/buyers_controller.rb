class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_product, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @form = Form.new
  end

  def create
    @form = Form.new(buyer_params)
    if @form.valid?
      pay_product
      @form.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end


  def buyer_params
    params.require(:form).permit(:postal_code, :sent_area_id, :city, :address, :phone_number, :building_name).merge(product_id: params[:product_id], user_id: current_user.id, token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if user_signed_in? && current_user.id == @product.user_id || @product.history.present?
      redirect_to root_path
    end
  end
end
