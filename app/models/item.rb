class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_area
  belongs_to :shipping_fee
  belongs_to :shipping_period
  
  validates :title, :text, :price, presence: true
  
  
  validates :category_id,:condition_id, :shipping_area_id, :shipping_fee_id, :shipping_period_id, numericality: { other_than: 1 , message: "can't be blank"}
end

