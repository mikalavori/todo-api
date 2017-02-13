Rails.application.routes.draw do
  resource :user do
    post 'authenticate', on: :collection
  end
end
