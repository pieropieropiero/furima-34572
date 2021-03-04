FactoryBot.define do
  factory :product do
    association :user
    name                 {"EGG"}
    introduction         {"たまご"}
    category_id             {2}
    status_id               {2}
    sent_fee_id             {2}
    sent_area_id            {10}
    arrival_period_id       {2}
    price           {1000}

    after(:build) do |product|
      product.image.attach(io: File.open('app/assets/images/test_image.png'), filename: 'test_image.png')
    end

  end
end


