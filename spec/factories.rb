FactoryBot.define do
  factory :person1 do
    email "sepid@test.com" 
    password "123456" 
    full_name "Sepid Mir" 
    social_insurance_number "1234567890" 
    birth_date 40.years.ago 
    # sequence(:username) { |n| "user#{n}" }
  end
end