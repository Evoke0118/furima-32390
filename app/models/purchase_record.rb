class PurchaseRecord
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :region_id, :city, :house_number, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
   end

   validates :region_id, numericality: { other_than: 1, message: "can't be blank" }


  def save
    order = Order.create(item_id: item_id, user_id: user_id)   
    Address.create(post_code: post_code, region_id: region_id, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end


# 購入管理テーブル+モデル => ordersテーブル、orderモデル
# 配送先テーブル+モデル   => addressesテーブル、addressモデル

# フォームオブジェクト（名前自由）=> PurchaseRecord

