Rails.application.routes.draw do
  root to: "libraries#index"

  resources :users
  resources :libraries do
    member do
      get :info
    end
    resources :assets do
      resources :comments

      collection do
        get :delete
        delete :delete
      end
    end
    resources :saved_searches, only: [:create, :destroy], shallow: true
  end
end
