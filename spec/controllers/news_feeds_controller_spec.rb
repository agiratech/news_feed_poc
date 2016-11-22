require "rails_helper"

# RSpec.configure {|c| c.before { expect(controller).not_to be_nil }}
RSpec.describe NewsFeedsController, :type => :controller do 

  describe "GET index" do

    it "gets all user feeds as json format" do
      get 'index'
      json = JSON.parse(response.body)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
    
    
  end

end