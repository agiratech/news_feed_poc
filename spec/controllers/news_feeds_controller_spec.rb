require "rails_helper"

# RSpec.configure {|c| c.before { expect(controller).not_to be_nil }}
RSpec.describe NewsFeedsController, :type => :controller do 

  describe "GET index" do

    it "renders all feeds" do
      @user = FactoryGirl.create(:user)
      @post = FactoryGirl.create(:post, user_id: @user.id)
      get 'feeds',{ user_id: @user.id} 
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["status"]).to eq(1)
    end

    it "doesn't render posts without user_id" do
      @user = FactoryGirl.create(:user)
      @post = Post.create(id: nil, description: nil, user_id: nil)
      get 'feeds', format: :json
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["status"]).to eq(0)
    end
  end

end