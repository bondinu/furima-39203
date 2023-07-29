FactoryBot.define do
  factory :order_address do
    postcode { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09012345678' }
  end
end