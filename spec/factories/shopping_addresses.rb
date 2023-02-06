FactoryBot.define do
  factory :shopping_address do
    post_code { '000-0000' }
    city { 'sample' }
    address_line { 'sample' }
    address_line_sub { 'sample' }
    phon_number { '0000000000' }
  end
end
