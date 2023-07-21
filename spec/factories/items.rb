FactoryBot.define do
  factory :item do
    items_name { "サンプル商品" }
    item_text { "これはサンプル商品の説明文です。" }
    category_id { 2 }
    condition_id { 2 }
    delivery_id { 2 }
    prefecture_id { 2 }
    load_id { 2 }
    price { 1000 }
    user { create(:user) }

    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'staff1.jpg'), 'image/jpg') }
  end
end