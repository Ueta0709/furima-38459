FactoryBot.define do
  factory :purchase_history_shopping_adress do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '000-0000' }
    city { 'sample' }
    address_line { 'sample' }
    address_line_sub { 'sample' }
    phon_number { '0000000000' }
    shipping_area_id {'2'}
    item_id{'1'}
    user_id{'1'}
  end
end
