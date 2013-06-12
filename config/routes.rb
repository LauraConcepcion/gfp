Gfp::Application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :teachers
  resources :criterions
  resources :tlresults do
    resources :criterions
  end
  resources :qualifyingentities
  resources :qualifyingentity_tlresults
  resources :teachers do 
    post 'change_current_profile'
    resources :profiles do
      get 'asign_tlresult', :on => :member
    end
  end
  resources :qualifyingentities do 
    get 'put_scores', :on => :member
  end

  resources :teachers do 
    resources :profiles do
      resources :qualifyingentities
    end
  end

  resources :trainercycles do
    resources :matters
    get 'update_matter', :on => :member
  end

  resources :students do
    collection { post :import}
  end

  resources :institutes

  root :to => "pages#home"
  match ':controller(/:action(/:id(.:format)))' 

  # match 'institutes/update_trainercycle/:id', :controller=>'institutes', :action => 'update_trainercycle'
  # match 'trainercycles/update_matter/:id', :controller=>'trainercycles', :action => 'update_matter'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
