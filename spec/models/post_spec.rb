require 'rails_helper'

RSpec.describe Post, :type => :model do

  it "post valid with valid fields" do
    post = FactoryGirl.create(:post)
    expect(post).to be_valid
  end

  it "post invalid with invalid fields" do
    post = Post.create(description: nil)
    expect(post).to_not be_valid
  end

end