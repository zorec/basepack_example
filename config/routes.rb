IssueTracker::Application.routes.draw do
  devise_for :users
  concern :resourcable do
      get    'options',     :on => :collection
      get    'query',       :on => :collection
      post   'query',       :on => :collection
      get    'export',      :on => :collection
      post   'export',      :on => :collection
      get    'import',      :on => :collection
      post   'import',      :on => :collection
      patch  'import',      :on => :collection
      delete 'import',      :on => :collection

      get    'filters',     :on => :collection
      get    'taggings',     :on => :collection
      #patch  'list_columns', :on => :collection
      #put    'list_columns', :on => :collection
  end
  resources :versions, concerns: :resourcable
  resources :users, concerns: :resourcable
  
  resources :issues, concerns: :resourcable do
    resources :comments, concerns: :resourcable
    get 'get_involved' => 'issues', on: :member
    get 'get_uninvolved' => 'issues', on: :member
  end
  
  resources :projects, concerns: :resourcable do
    resources :issues, concerns: :resourcable
  end

  resources :acts_as_taggable_on_tags, :filters, concerns: :resourcable

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'projects#index'

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
