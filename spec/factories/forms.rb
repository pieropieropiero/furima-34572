FactoryBot.define do
  factory :form do
    token          {"hoge"}
    postal_code    { '123-4567' }
    sent_area_id   { 10 }
    city           { '東京都' }
    address        { '1-1' }
    building_name  {"ライオンズマンション"}
    phone_number   {"00000000000"}
    
  end
end
