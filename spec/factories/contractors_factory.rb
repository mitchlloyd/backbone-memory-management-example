FactoryGirl.define do
  sequence(:contractor_name) {|n| "Contractor ##{n}" }

  factory :contractor do
    name { generate :contractor_name }
    display true
  end
end
