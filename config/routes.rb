Rails.application.routes.draw do
  resource :user do
    post 'authenticate', on: :collection
    resources :todos
  end
end
