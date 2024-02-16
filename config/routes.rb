Rails.application.routes.draw do
  # root 'pages#home'
  # get '*path', to: 'pages#home', via: :all

  resources :reviews
  get '/download_reviews_excel', to: 'reviews#download_reviews_excel'
  get '/confirm_delivery', to: 'reviews#confirm_delivery'
  root 'reviews#submit_review'
end
