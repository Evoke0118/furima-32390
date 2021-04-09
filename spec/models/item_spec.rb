require 'rails_helper'
RSpec.describe User, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品できないとき' do
      it "imageが空では登録できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end

    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end     

    it "descriptionが空では登録できないこと" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end  

    it "category_idが空では登録できないこと" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end  

    it "status_idが空では登録できないこと" do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end 

    it "postage_idが空では登録できないこと" do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end 

    it "region_idが空では登録できないこと" do
      @item.region_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Region can't be blank")
    end 

    it "shipping_date_idが空では登録できないこと" do
      @item.shipping_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date can't be blank")
    end 

    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end 

    it "価格の範囲が、¥300~¥9,999,999の間でないと登録できないこと" do
      @item.price = 10
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end 

    it "販売価格は半角数字でないと保存できないこと" do
      @item.price = "ああああ"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

end