class ShippingFee < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 3, name: '送料込み（出品者負担）' }
  ]

  include ActiveHash::Associations
  has_many :items

  end