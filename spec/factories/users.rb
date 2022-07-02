FactoryBot.define do
  factory :user do
    nickname              {"田中さん"}
    email                 {Faker::Internet.free_email}
    password              {"a123456"}
    password_confirmation {password}
    last_name             {"田中"}
    first_name            {"太朗"}
    last_name_kana        {"タナカ"}
    first_name_kana       {"タロウ"}
    birthday              {"1930-01-01"}


  end
end