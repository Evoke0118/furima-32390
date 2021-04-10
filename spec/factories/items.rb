FactoryBot.define do
  factory :item do
    name              {"オムライス"}
    description       {"あああああ"}
    category_id       {2}
    status_id         {2}
    postage_id        {2}
    region_id         {2}
    shipping_date_id  {2}
    price             {300}
  end
end
