class Item < ApplicationRecord

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_area
  belongs_to :shipping_fee
  belongs_to :shipping_period
  has_one_attached :image
  
  validates :title, :text, :image, presence: true
  validates :price, presence: true, numericality: { greater_than: 299, less_than: 10000000 }, format: { with: /\A[0-9]+\z/i}
  
  validates :category_id,:condition_id, :shipping_area_id, :shipping_fee_id, :shipping_period_id, numericality: { other_than: 1 , message: "can't be blank"}
end

