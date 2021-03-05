require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品出品ができるとき' do
      it "全ての情報が存在すれば出品できる" do
        expect(@product).to be_valid
      end
    end

    context '商品の出品ができないとき' do
      it "nameが空では出品できない" do
        @product.name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it "introductionが空では出品できない" do
        @product.introduction = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Introduction can't be blank")
      end
      it "category_idが空では出品できない" do
        @product.category_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idが1では出品できない" do
        @product.category_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end
      it "status_idが空では出品できない" do
        @product.status_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end
      it "status_idが1では出品できない" do
        @product.status_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Status must be other than 1")
      end
      it "sent_fee_idが空では出品できない" do
        @product.sent_fee_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Sent fee can't be blank")
      end
      it "sent_fee_idが1では出品できない" do
        @product.sent_fee_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Sent fee must be other than 1")
      end
      it "sent_area_idが空では出品できない" do
        @product.sent_area_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Sent area can't be blank")
      end
      it "sent_area_idが1では出品できない" do
        @product.sent_area_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Sent area must be other than 1")
      end
      it "arrival_period_idが空では出品できない" do
        @product.arrival_period_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Arrival period can't be blank")
      end
      it "arrival_period_idが1では出品できない" do
        @product.arrival_period_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Arrival period is not a number")
      end
      it "priceが空では出品できない" do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが299円以下では出品できない" do
        @product.price = "299"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが10000000円以上では出品できない" do
        @product.price = "10000000"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが全角文字では出品できない" do
        @product.price = "１０００"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが半角英数混合では出品できない" do
        @product.price = "58ut7"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが半角英語だけでは出品できない" do
        @product.price = "yuldkf"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      it "imageが空では出品できない" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

    end
  end
end
 