Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :internal do
    end
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
