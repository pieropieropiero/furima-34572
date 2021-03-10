require 'rails_helper'

RSpec.describe Form, type: :model do
  before do

    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @form = FactoryBot.build(:form, user_id: user.id,product_id: product.id)
    sleep 0.05
  end

  describe '商品購入' do
    context '商品購入ができるとき' do
      it "全ての情報が存在すれば購入できる" do
        expect(@form).to be_valid
      end
    end

    context '商品の購入ができないとき' do
      it "tokenが空では購入できない" do
        @form.token = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end

      it "postal_codeが空では購入できない" do
        @form.postal_code = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeに-を含んでいなければ購入できない" do
        @form.postal_code = "1234567"
        @form.valid?
        expect(@form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "sent_area_idが空では購入できない" do
        @form.sent_area_id = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("Sent area can't be blank")
      end
      it "sent_area_idが1では購入できない" do
        @form.sent_area_id = "1"
        @form.valid?
        expect(@form.errors.full_messages).to include("Sent area must be other than 1")
      end
      it "cityが空では購入できない" do
        @form.city = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空では購入できない" do
        @form.address = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("Address can't be blank")
      end
      it 'bulding_nameが空でも購入できること' do
        @form.building_name = ''
        expect(@form).to be_valid
      end
      it "phone_numberが空では購入できない" do
        @form.phone_number = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phoneが12桁以上では購入できない" do
        @form.phone_number = "000000000000"
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "user_idが空では購入できない" do
        @form.user_id = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("User can't be blank")
      end
      it "product_idが空では購入できない" do
        @form.product_id = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end