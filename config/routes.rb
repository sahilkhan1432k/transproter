Rails.application.routes.draw do
  root 'rooms#index'
  resources :messages
  devise_for :users
  resources :vehicles do
    get :applications
    collection do
      get :my_vehicles
    end
    resources :job_applications do
      member do
        put :interviewed
        put :shortlisted
        put :hired
        put :rejected
      end
      collection do
        patch :approve
      end
    end
  end
  resources :plants do
    resources :materials
  end
  resources :messages, only: [:new, :create]
  resources :rooms
  # root 'home#index'
  get 'home/about'
end
