class Item < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :region
  belongs_to :shipping_date


  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 }, presence: true
  validates :status_id, numericality: { other_than: 1 }, presence: true
  validates :postage_id, numericality: { other_than: 1 }, presence: true
  validates :region_id, numericality: { other_than: 1 }, presence: true
  validates :shipping_date_id, numericality: { other_than: 1 }, presence: true
  VALID_PRICEL_HALF = /\A[0-9]+\z/ 
  validates :price, presence: true,
                    numericality: { with: VALID_PRICEL_HALF, message: 'Half-width number' }
  validates :price, numericality: {
      greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
      message: 'Out of setting range' } 


end


