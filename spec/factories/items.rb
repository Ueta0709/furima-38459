FactoryBot.define do
  
  factory :item do
    association :user
    title                       {'sample'}
    price                       {'1000'}
    text                        {'sample'}
    category_id                 {'2'}
    condition_id                {'2'}
    shipping_fee_id             {'2'}
    shipping_area_id            {'2'}
    shipping_period_id          {'2'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
