LazyRegistration::Application.routes.draw do
  devise_for :users, :controllers => { :confirmations => "confirmations" }

  as :user do
      match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
      match '/user/confirm' => 'confirmations#confirm_user', :via => :post, :as => :confirm_user
  end

  as :pages do 
    get '/protected' => 'pages#protected', as: :protected
    get '/protected_until_confirmed' => 'pages#protected_until_confirmed', as: :protected_until_confirmed
    get '/unconfirmed' => 'pages#unconfirmed', as: :unconfirmed
  end
  
  root 'pages#home'
  
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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
