FactoryGirl.define do
  factory :user do
    name "Joe Schmoe"
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password "SecretP@ss"
    password_confirmation "SecretP@ss"
  end
end
