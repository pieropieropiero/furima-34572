FactoryBot.define do
  factory :form do
    postal_code    { '123-4567' }
    sent_area_id   { 10 }
    city           { '東京都' }
    address        { '1-1' }
    phone_number   {"00000000000"}
    
  end
end
