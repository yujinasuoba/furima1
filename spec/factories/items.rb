FactoryBot.define do
  factory :item do
    name               {Faker::Commerce.product_name}
    description        {Faker::Lorem.sentence}
    price              {Faker::Number.between(from: 300, to: 9_999_999)}
    category_id        {Faker::Number.within(range: 2..11)}
    condition_id       {Faker::Number.within(range: 2..7)}
    shipping_fee_id    {Faker::Number.within(range: 2..3)}
    shipping_from_id   {Faker::Number.within(range: 2..48)}
    shipping_start_id  {Faker::Number.within(range: 2..4)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
    
  end
end

     