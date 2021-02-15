FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence }
    price { '5000' }
    category_id { '1' }
    status_id { '1' }
    prefectures_id { '1' }
    delivery_fee_id { '1' }
    shipping_id { '1' }
    user_id { '1' }

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end

  end
end
