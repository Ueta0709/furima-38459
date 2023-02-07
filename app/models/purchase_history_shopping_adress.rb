class PurchaseHistoryShoppingAdress
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :city, :address_line, :address_line_sub, :phon_number, :purchase_history_id, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :shipping_area_id, :city, :address_line, :token, :shipping_area_id
    validates :phon_number, length: { in: 10..11 }, format: {with: /\A[0-9]+\z/i}
  end

  def save
    purchase_history = PurchaseHistory.create(item_id: item_id, user_id: user_id)
    ShoppingAddress.create(post_code: post_code, shipping_area_id: shipping_area_id, city: city, address_line: address_line, address_line_sub: address_line_sub, phon_number: phon_number, purchase_history_id: purchase_history.id)
  end

end