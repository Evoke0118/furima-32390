require 'rails_helper'
RSpec.describe PurchaseRecord, type: :model do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_record = FactoryBot.build(:purchase_record, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    describe '商品購入機能' do
      context '購入できるとき' do
        it "全ての値が正しく入力されていれば購入出来ること" do
          expect(@purchase_record).to be_valid
        end
      end

      context '購入できないとき' do
       it "クレジット情報が空では登録出来ないこと" do
         @purchase_record.token = nil
         @purchase_record.valid?
         expect(@purchase_record.errors.full_messages).to include("Token can't be blank")
       end

        it "post_codeが空では登録出来ないこと" do
          @purchase_record.post_code = nil
          @purchase_record.valid?
          expect(@purchase_record.errors.full_messages).to include("Post code can't be blank")
        end

        it "郵便番号がハイフン不要では登録出来ないこと" do
          @purchase_record.post_code = "1231111"
          @purchase_record.valid?
          expect(@purchase_record.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        end

        it "region_idが空では登録出来ないこと" do
          @purchase_record.region_id = nil
          @purchase_record.valid?
          expect(@purchase_record.errors.full_messages).to include("Region can't be blank")
         end
      
        it "cityが空では登録出来ないこと" do
          @purchase_record.city = nil
          @purchase_record.valid?
          expect(@purchase_record.errors.full_messages).to include("City can't be blank")
        end
     
        it "house_numberが空では登録出来ないこと" do
          @purchase_record.house_number = nil
          @purchase_record.valid?
          expect(@purchase_record.errors.full_messages).to include("House number can't be blank")
        end

        it "phone_numberが空では登録出来ないこと" do
          @purchase_record.phone_number = nil
          @purchase_record.valid?
          expect(@purchase_record.errors.full_messages).to include("Phone number can't be blank")
        end

        it "電話番号はハイフン不要で11桁以内でないと登録出来ないこと" do
          @purchase_record.phone_number = "090-1234-5678"
          @purchase_record.valid?
          expect(@purchase_record.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
        end
      end  
    end
  end