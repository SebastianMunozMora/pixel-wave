Rails.application.routes.draw do
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
  get 'category/', to: 'category#index', as: 'category'
  get 'custom_article/index'
  get 'morse_interpreter/index'
  get 'test/index'
  get 'test/thumb'
  get 'test/full'
  get 'main_page/index'
  get 'morse_interpreter/', to: 'morse_interpreter#index', as: 'morse_interpreter'
  resources :articles
  resources :authors
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "main_page#index"

end
