Rails.application.routes.draw do
  get 'donation/', to: 'donation#index', as: 'donation'
  get "donation/index"
  get "donation/thank_you"
  get "donation/try_again"
  devise_for :users
  get "templates/index"
  get "templates/minimalist"
  get "templates/vibrant"
  get "templates/elegant"
  get "featured/index"
  get "featured/andyoz"
  get "featured/index"
  get "featured/andy-oz"
  get 'date/index'
  get 'date/latest'
  get 'date/oldest'
  get 'date/current-date'
  get 'date/', to: 'date#index', as: 'date'
  get 'category/index'
  get 'category/video-games'
  get 'category/movies'
  get 'category/comics'
  get 'category/books'
  get 'category/tech'
  get 'category/entertainment'
  get 'category/science'
  get 'category/lifestyle'
  get 'category/series'
  get 'category/', to: 'category#index', as: 'category'
  get 'category/music', to: 'category#index', as: 'music'
  get 'custom_article/index'
  get 'morse_interpreter/index'
  get 'test/index'
  get 'test/thumb'
  get 'test/full'
  get 'main_page/index'
  get 'morse_interpreter/', to: 'morse_interpreter#index', as: 'morse_interpreter'
  get "about_us/index"
  get "about_us/", to: "about_us#index", as: "about_us"
  resources :articles do
    member do
      patch :like
      patch :dislike
    end
  end
  resources :authors
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "main_page#index"

end
