Rails.application.routes.draw do
  root to: "libraries#index"
  resources :searches, only: [ :create, :delete, :index ]
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
  end
end
