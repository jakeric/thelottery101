Rails.application.routes.draw do
  #get 'prizes/index'
  # get 'prizes/show'
  # devise_for :users
  # root to: 'pages#home'

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'prizes#index', as: :authenticated_root
      resources :prizes
      post 'prizes/index' => 'prizes#get_random_ticket'
      post 'prizes/show' => 'prizes#save_ticket_to_prize'
      post 'destroy' => 'prizes#destroy', as: :destroy
      post 'update' => 'tickets#update'
      get 'list' => 'prizes#list'
      # root 'prizes#index', as: :authenticated_root
    end


    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
