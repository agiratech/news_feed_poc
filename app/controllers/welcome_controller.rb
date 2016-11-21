module V2
  require "#{Rails.root}/lib/jurni_event"

  class WelcomeController < ApplicationController
    def show
      render :plain => "Hello World"
    end

    def register
      begin
        # V2 app secret
        raise "Invalid app_secret" unless params["app_secret"] == "8YHsvw7fuylbLr5FevrFAsRC/v2sH5X8i9aWODH76908GxhIE/+jDj0cVJft+zTx2WkQmxiGM06KAnBtG1C7gg=="
        ak = V2::APIKey.register(params)
        JurniEvent.new_api_key_event(ak)
        render :json => {"status" => 1, "api_key" => ak.api_key.to_s, "api_secret" => ak.api_secret.to_s}
      rescue => e
        render :json => {"status" => 0, "error" => e.to_s}.to_json
      end
    end
  end
end
