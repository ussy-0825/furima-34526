FactoryBot.define do
  factory :orderdelivery do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '111-1111' }
    prefectures_id { 1 }
    city { '〇〇市' }
    address { '〇〇町' }
    building { '〇〇ビル' }
    phone { '09011111111' }
    user_id { 1 }
    item_id { 1 }
  end
end
