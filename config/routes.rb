Rails.application.routes.draw do
  
  post '/login', to: "auth#create"
  get '/welcome', to: "application#welcome"
  
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end

end
