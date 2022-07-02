FactoryBot.define do
  factory :orders_ordersdetail do
    post_code        { '123-4567' }
    prefecture_id    { 2 }
    city             { '東京都' }
    block            { '111' }
    phone_number     { '08012345678' }
    token            {"tok_abcdefghijk00000000000000000"}
    user_id          { 'user' }
    item_id          { 'item' }
  end
end
