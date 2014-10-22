Rails.application.routes.draw do
  
  root 'pages#home'
  post 'pages/search' => 'pages#search', as: :search
  get 'pages/:id/detail' => 'pages#detail', as: :detail
  get 'pages/:id/confirm' => 'pages#confirm', as: :confirm
  get 'tags/:tag' => 'pages#home', as: :tag
  get 'admin/tags/:tag' => 'admin/accounts#index', as: :admin_tag
  post 'express_checkout/:account_id', to: 'billing#express_checkout', as: :express_checkout
  get 'confirm_buy/:account_id', to: 'billing#confirm_buy', as: :confirm_buy
  post 'buy', to: 'billing#buy', as: :buy

  namespace :admin do
    root 'accounts#index'
    resources :account_photos
    resources :accounts

    resources :user_sessions
    resources :users

    get 'login' => 'user_sessions#new', :as => :login
    post 'logout' => 'user_sessions#destroy', :as => :logout
  end 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
