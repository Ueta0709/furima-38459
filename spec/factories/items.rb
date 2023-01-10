FactoryBot.define do
  factory :item do
    
    title                       {'sample'}
    price                       {'1000'}
    text                        {'sample'}
    category_id                 {'2'}
    condition_id                {'2'}
    shipping_fee_id             {'2'}
    shipping_area_id            {'2'}
    shipping_period_id          {'2'}

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
