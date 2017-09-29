Rails.application.routes.draw do
  post '/login', to: "auth#create"
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
end
