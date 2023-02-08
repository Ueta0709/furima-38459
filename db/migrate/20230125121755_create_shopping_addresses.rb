class CreateShoppingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_addresses do |t|
      t.string         :post_code                  , null: false
      t.integer        :shipping_area_id           , null: false
      t.string         :city                       , null: false
      t.string         :address_line               , null: false
      t.string         :address_line_sub
      t.string         :phon_number                , null: false
      t.references     :purchase_history           , null: false, foreign_key: true
      t.timestamps
    end
  end
end
