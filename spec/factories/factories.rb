
FactoryGirl.define do
  factory :user do
    email "user1@gmail.com"
    password_digest "password"
    first_name "First"
    last_name "Last"
    phone_number "18008675309"
  end

  factory :request do
    driver "true"
    origin_loc "261 Molimo Blvd"
    destination_loc "633 Folsom Street"
  end
end
