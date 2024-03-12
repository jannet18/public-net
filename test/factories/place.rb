FactoryBot.define do
    factory :place do
        name {Faker::Name.name}
       address { Faker::Address.street_address}
       city {Faker::Address.city}

    #    trait :Nifty do
    #     name {"Como Cafe"}
    #     address {"Tigoni"}
    #     city {"Limuru"}
    #    end 

    #     trait :Nifty do
    #         name {"Thayu Hotel"}
    #         address {"Tigoni"}
    #         city {"Limuru"}
    #     end 
    end
end