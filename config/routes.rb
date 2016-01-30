Rails.application.routes.draw do
  resources :drives, only: %i(index show create) do
    resources :run_informations, only: %i(index show create) do
      post :bulk_create, on: :collection
    end
  end
end
