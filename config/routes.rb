Gfp::Application.routes.draw do
  get "teachers/index"

  get "teachers/new"

  get "teachers/edit"

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  resources :institutes
  resources :teachers do 
    resources :profiles  
  end
  resources :teachers

  
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :teacher, 
      :controllers => { 
       :sessions => "teachers/sessions", 
       :passwords => "teachers/passwords",
       :registrations => "teachers/registrations" }, :path => "teachers",
          :skip => [:sessions, :passwords, :registrations] do
          get 'teacher/sign_in' => 'teachers/sessions#new', :as => :new_teacher_session
          post 'teacher/sign_in' => 'teachers/sessions#create', :as => :teacher_session
          get 'teacher/sign_out' => 'teachers/sessions#destroy', :as => :destroy_teacher_session

          get 'teacher/sign_up' => 'teachers/registrations#new', :as => :new_teacher_registration
          get 'teacher/account' => 'teachers/registrations#edit', :as => :edit_teacher_registration
          post 'teacher/account' => 'teachers/registrations#create', :as => :teacher_registration
          get 'teacher/cancel' => 'teachers/registrations#cancel', :as => :cancel_teacher_registration
          put 'teacher/account' => 'teachers/registrations#update'
          delete 'teacher/account' => 'teachers/registrations#destroy'
                                       
          post 'teacher/password' => 'teachers/passwords#create', :as => :teacher_password
          get 'teacher/password/new' => 'teachers/passwords#new', :as => :new_teacher_password
          get 'teacher/password/edit' => 'teachers/passwords#edit', :as => :edit_teacher_password    
          put 'teacher/password' => 'teachers/passwords#update'
  end 
  resources :institutes
  root :to => 'institutes#index'
  match ':controller(/:action(/:id(.:format)))' 
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
