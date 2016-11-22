FactoryGirl.define do 
  factory :post do
    association :user
    description 'some text'  
  end
end