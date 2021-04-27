FactoryBot.define do
  factory :item do
    name {"プロテイン名"}
    taste {"味"}
    price {999}
    protein {10}
    lipid {1}
    amount{10}
    impression{"おすすめのポイント"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
