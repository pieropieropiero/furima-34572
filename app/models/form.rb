class Form
  include ActiveModel::Model
  attr_accessor :product_id, :user_id, :postal_code, :sent_area_id , :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :sent_area_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, length: { maximum: 11 }
    validates :phone_number, numericality: { message: "is invalid."}
    validates :product_id
    validates :user_id
  end

  def save
    history = History.create(product_id: product_id, user_id: user_id)
    Buyer.create(postal_code: postal_code, sent_area_id: sent_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, history_id: history.id)
  end
end