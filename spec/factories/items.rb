FactoryBot.define do
  factory :item do
    item                {"観葉植物"}
    description         {"植物"}
    price               {1000}
    category_id         {2}
    condition_id        {2}
    shipping_charge_id  {2}
    prefecture_id       {2}
    days_to_ship_id     {2}

    after(:build) do |item|
      item.image.attach(io: File.open('spec/images/テスト用の画像.png'), filename: 'テスト用の画像.png' )
    end
    
    association :user

  end
end
