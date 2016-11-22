class NewsFeedsController < ApplicationController

  before_action :set_user
  # Action to perform news feeds listing
  def activities
    begin
      feeds = @user.user_feeds(params[:page], params[:limit]) # Will return feeds for given user
      render :json => {"status" => 1, "feeds" => feeds}.to_json
    rescue
      render :json => {"status" => 0, "errors" => "Something went wrong"}.to_json
    end
  end

  def feeds
    begin
      follower_ids = @user.followers.map(&:friend_id)
      follower_ids << @user.id
      feeds = Post.where("user_id in (?)", follower_ids).order("created_at DESC").paginate(:page => params[:page], :per_page => params[:limit])
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
