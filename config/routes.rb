Rails.application.routes.draw do
  root 'application#main'

  # get 'test', to: 'application#test'

  resources :products, only: [:show, :index] do
    get 'search', on: :collection
  end
end
