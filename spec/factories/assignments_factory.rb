FactoryGirl.define do
  factory :assignment do
    contractor
    project
    # Rails feels like weeks start on Monday. However, the client feels like 
    # weeks start on Sunday.
    week (DateTime.now.at_beginning_of_week(:sunday))
  end
end
