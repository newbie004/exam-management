Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # config/routes.rb
  resources :users, only: [:create, :update]
  resources :exams, only: [:create, :update]
  resources :colleges, only: [:create]
  resources :exam_windows, only: [:create]

end
