class NewsFeedsController < ApplicationController

  before_action :set_user
  # Action to perform news feeds listing
  def index
    begin
      feeds = @user.user_feeds(params[:page, params[:limit]]) # Will return feeds for given user
      render :json => {"status" => 1, "feeds" => feeds}.to_json
    rescue
      render :json => {"status" => 0, "errors" => "Something went wrong"}.to_json
    end
  end

  private

  # To set user
  def set_user
    @user = User.where("id =?",params[:user_id]).first
    if @user.nil?
      render :json => {"status" => 0, "errors" => "User not found"}.to_json
    end
  end

end
