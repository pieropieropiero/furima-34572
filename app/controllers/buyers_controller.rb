class BuyersController < ApplicationController

  before_action :set_product, only: [:index, :create]

  def index
    @form = Form.new
  end

  def create
    @form = Form.new(buyer_params)
    if @form.valid?
    @form.save
    else
      render 'index'
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end


  def buyer_params
    params.require(:form).permit(:postal_code, :sent_area_id, :city, :address, :phone_number, :building_name).merge(product_id: params[:product_id], user_id: current_user.id)
  end

end
