FactoryGirl.define do
  sequence(:project_name) {|n| "Project ##{n}" }

  factory :project do
    name { generate :project_name }
    display true
  end
end