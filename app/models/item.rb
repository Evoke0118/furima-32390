class Item < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :region
  belongs_to :shipping_date
  has_one :order



 with_options presence: true do
  validates :image
  validates :name
  validates :description
  validates :price
 end

 with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :status_id
  validates :postage_id
  validates :region_id
  validates :shipping_date_id
 end

  VALID_PRICEL_HALF = /\A[0-9]+\z/ 
  validates :price, numericality: { with: VALID_PRICEL_HALF, message: 'Half-width number' }
  validates :price, numericality: {
      greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
      message: 'Out of setting range' } 
 
end

     
