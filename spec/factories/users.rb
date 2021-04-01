FactoryBot.define do
  factory :user do
    nick_name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {"111aaa"}
    password_confirmation {"111aaa"}
    last_name {"ぜんかく"}
    first_name {"ぜんかく"}
    last_name_kana {"ゼンカクカナ"}
    first_name_kana {"ゼンカクカナ"}
    birthday {"2021-1-1"}
  end
end


