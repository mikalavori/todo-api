Rails.application.routes.draw do
  resources :users do
    post 'authenticate', on: :collection
  end
end
