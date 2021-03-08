class クラス名
  include ActiveModel::Model
  attr_accessor :attr_accessor :product_id, :user_id, :postal_code, :sent_area_id , :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :sent_area_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone, length: { maximum: 11 }
    validates :phone, numericality: { message: "is invalid."}
   

def save
  # 寄付情報を保存し、変数donationに代入する
  donation = Donation.create(price: price, user_id: user_id)
  # 住所を保存する
  # donation_idには、変数donationのidと指定する
  Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, donation_id: donation.id)
end

  # ここにバリデーションの処理を書く

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end