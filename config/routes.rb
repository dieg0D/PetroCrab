Rails.application.routes.draw do
 root to: "home#index"

 get '/record', to: "home#record"

 post "/create_audio", to: "home#create"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/create', to: 'audio#create'
    end 
  end
end
