FactoryBot.define do
  factory :item do
    title                       { Faker::Commerce.product_name }
    description                 { Faker::Lorem.sentence }
    category_id                 { Faker::Number.between(from: 2, to: 10) }
    status_id                   { Faker::Number.between(from: 2, to: 7) }
    postage_id                  { Faker::Number.between(from: 2, to: 3) }
    prefecture_id               { Faker::Number.between(from: 2, to: 48) }
    deadline_id                 { Faker::Number.between(from: 2, to: 4) }
    cost                        { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
