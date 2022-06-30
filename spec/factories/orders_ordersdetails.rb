FactoryBot.define do
  factory :orders_ordersdetail do
    post_code        { '123-4567' }
    prefecture_id    { 2 }
    city             { '東京都' }
    block            { '111' }
    phone_number     { '08012345678' }
  end
end
