require 'rails_helper'
RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

  describe 'ユーザー新規登録' do
   context '新規登録できるとき' do
    it "nick_name、first_name、last_name、first_name_kana、last_name_kana、email、password、password_confirmation、birthdayが存在すれば登録できること" do
      # user = build(:user)
      expect(@user).to be_valid
    end
   end 
   
      
  context '新規登録できないとき' do
    it "nick_nameが空では登録できないこと" do
      @user.nick_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end
  end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end     

    it "emailに@がない場合は登録できないこと" do
      @user.email = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが数字のみの場合は登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください") 
    end

    it "passwordが英字のみの場合は登録できないこと" do
      @user.password = "abcdef"
      @user.password_confirmation = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it "first_nameがない場合は登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "first_name_kanaが空では登録できないこと" do   
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "last_name_kanaが空では登録できないこと" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end   

    it "birthdayがない場合は登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
