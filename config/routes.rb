Rails.application.routes.draw do

  # API endpoint check
  root 'welcome#index'

  get 'feeds' => 'news_feeds#index'

end
