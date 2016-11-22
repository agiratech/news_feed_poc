require 'rails_helper'

RSpec.describe User, :type => :model do

  it "user valid with valid fields" do
    user = FactoryGirl.create(:user)
    expect(user).to be_valid
  end

  it "user doesn't valid with invalid params" do
    user = User.create(user_name: nil, geo_location: nil)
    expect(user).to_not be_valid
  end

  it "user doesn't valid with invalid user_name" do
    user = User.create(user_name: nil, geo_location: 'AnyLocation')
    expect(user).to_not be_valid
  end

  it "user doesn't valid with invalid geo_location" do
    user = User.create(user_name: 'AnyName', geo_location: nil)
    expect(user).to_not be_valid
  end

end

