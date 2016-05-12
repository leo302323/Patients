FactoryGirl.define do
  factory :patient do
    association :location
    first_name "MyString"
    middle_name "MyString"
    last_name "MyString"
    date_of_birth Time.zone.now
    gender "female"
    status "treatment"
  end
end