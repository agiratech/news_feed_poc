Rails.application.routes.draw do

  # API endpoint check
  root 'welcome#index'

  get 'feeds' => 'news_feeds#feeds'
  get 'activities' => 'news_feeds#feeds'
  get 'feeds' => 'news_feeds#feeds'

end
