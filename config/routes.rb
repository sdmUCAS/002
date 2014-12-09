Rails.application.routes.draw do

  resources :undone_orders do
  	post :startup, :on => :collection, as: :startup
  	post :closedown, on: :collection, as: :closedown
  	post :account, on: :collection, as: :account
  	post :set_money, on: :collection, as: :set_money
  end

  resources :uncheck_orders do
  	post :agree_apointment, on: :collection, as: :agree_apointment
  end
  
  get 'welcome/login'
  post 'welcome/login'
  post 'welcome/show'
  get 'welcome/index'
  get 'iss', to: 'welcome#index'
  get 'welcome/show'
  get 'welcome/order'
  post 'welcome/create'
  post 'sessions/signup', to: 'users#new'
  get 'sessions/signin', to: 'sessions#new'
  get 'sessions/signout', to: 'sessions#destroy', via: :delete
  post 'sessions/add_to_cart', to: 'sessions#add_to_cart'
  post 'orders/new' , to: 'orders#create'

  resources :users,:sessions,:orders,:line_items,:carts

  resources :instruments do
	post :upload, on: :collection, as: :upload
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
