Rails.application.routes.draw do
  get '/create_pedido_json'=> "ordens#create_from_json"
  get '/getOrden'=> "ordens#getOrden"
  get '/getOrdenItems'=> "ordens#getOrdenItems"
  get '/create_item_pedido_json'=> "orden_items#create_from_json"
  get '/create_from_json'=> "items#create_from_json"
  get '/create_user_json'=> "items#create_user_json"
  get '/verify_password' => "items#verify_password"
  get '/verify_restaurant_password' => "items#verify_restaurant_password"
  get '/register_user' => "items#register_user"

  resources :orden_items

  resources :ordens

  devise_for :users

  resources :items

  resources :restaurants

  
  #post '/create_from_json'=>"items#create_from_json"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'items#index'
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
