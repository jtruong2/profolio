FactoryGirl.define do
  factory :user do
    first_name "Jimmy"
    last_name "Truong"
    email "Jimmy@aol.com "
    password "password"
    password_confirmation "password"
  end
end
