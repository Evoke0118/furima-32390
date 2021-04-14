require 'rails_helper'
RSpec.describe User, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end

  describe '商品出品機能' do
    context '出品できるとき' do
      it "全ての値が正しく入力されていれば出品出来ること" do
        expect(@item).to be_valid
      end
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
      expect(@item.errors.full_messages).to include("Category is not a number")
    end  

    it "category_idの値が1では登録できないこと" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end  

    it "status_idが空では登録できないこと" do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status is not a number")
    end 

    it "status_idの値が1では登録できないこと" do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end 

    it "postage_idが空では登録できないこと" do
      @item.postage_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage is not a number")
    end 

    it "postage_idの値が1では登録できないこと" do
      @item.postage_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage must be other than 1")
    end 

    it "region_idが空では登録できないこと" do
      @item.region_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Region is not a number")
    end
    
    it "region_idの値が1では登録できないこと" do
      @item.region_id = 1 
      @item.valid?
      expect(@item.errors.full_messages).to include("Region must be other than 1")
    end 

    it "shipping_date_idが空では登録できないこと" do
      @item.shipping_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date is not a number")
    end 

     it "shipping_date_idの値が1では登録できないこと" do
      @item.shipping_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
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

    it "価格が9,999,999を超えた時に登録できないこと" do
      @item.price = 99,999,999
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end 

    it "販売価格は半角数字でないと登録できないこと" do
      @item.price = "ああああ"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

    it "販売価格は全角数字では登録できないこと" do
      @item.price = "１１１１"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

    it "販売価格は半角英数字では登録できないこと" do
      @item.price = "aaaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end
    
    it "販売価格は半角英数字混合では登録できないこと" do
      @item.price = "1a1a1a1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

  end
end 
