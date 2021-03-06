Rails.application.routes.draw do
  resources :yotta, only: %i(create)

  resources :drives, only: %i(index show create update) do
    resources :run_informations, only: %i(index show create) do
      post :bulk_create, on: :collection
      get :analysis, on: :collection
    end
  end

  resources :users, only: %i() do
    get :latest_drive_id, on: :member
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
