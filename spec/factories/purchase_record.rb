FactoryBot.define do
  factory :purchase_record do
    token {"tok_abcdefghijk00000000000000000"}
    post_code {"123-4567"}
    region_id {2}
    city      {"横浜市緑区"}
    house_number{"1-1-1"}
    building {"柳ビル"}
    phone_number {"09012345678"}
  end
end

