Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'logins#new'
  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'
  get '/password', to: 'volunteers#password'
  
  resources :queries
  get '/queryone', to: 'queries#one'
  get '/querytwo', to: 'queries#two'
  get '/querythree', to: 'queries#three'
  get '/queryfour', to: 'queries#four'
  get '/queryfive', to: 'queries#five'
  get '/querysix', to: 'queries#six'
  get '/queryseven', to: 'queries#seven'
  get '/queryeight', to: 'queries#eight'
  get '/querynine', to: 'queries#nine'
  get '/queryten', to: 'queries#ten'
  
  
  get '/request', to: 'projects#project'
  get '/requestevent', to: 'shorttermevents#event'
  #get '/assign', to: 'projects#assign'
  
  resources :tools
  resources :sites
  resources :streets
  resources :parks 
  resources :washes
  resources :evaluationreports
  resources :reports
  resources :toolchecks
  resources :ceremonyawards
  resources :ceremonynotes
  resources :signs
  
  resources :shorttermevents do 
    resources :essigns
  end
  
  resources :volunteers do
    resources :organizations
    resources :groupcoordinators
    resources :regulatmembers
    resources :projects
  end

  resources :ceremonies do
    resources :ceremonyawards
    resources :ceremonynotes
    resources :signs
  end
  
  resources :organizations do
    resources :projects
    resources :evaluationreports
    resources :toolchecks
    resources :shorttermevents
  end
  resources :projects do
    resources :ceremonies
    resources :assigns
    resources :reports
  end
  get '/join-Organization', to: 'organizations#join'
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
