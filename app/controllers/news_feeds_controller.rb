class NewsFeedsController < ApplicationController

  # Action to perform news feeds listing
  def index
    user = User.find(params[:user_id])
    feeds = user.user_feeds # Will return feeds for given user
    render :json => {"status" => 0, "feeds" => feeds}.to_json
  end

end
