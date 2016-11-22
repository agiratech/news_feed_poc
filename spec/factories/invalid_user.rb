FactoryGirl.define do
  factory :invalid_user, class: User do
    user_name nil
    geo_location nil
    profile_picture nil
  
  end
end