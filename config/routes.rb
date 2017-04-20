Rails.application.routes.draw do

  root :to => 'welcome#index'


  resources :post_likes do
    put "upvote", to: "post_likes#upvote"
  end
  resources :topic_likes do
    put "upvote", to: "topic_likes#upvote"
  end
  resources :faqs
  resources :pages
  resources :testimonials
  resources :latest_items
  resources :videos
  resources :newsbars
  resources :posts do
    put "like", to: "posts#upvote"
    resources :comments, only: [:index, :create] do 
      put "like", to: "comments#upvote"
    end
  end
  resources :media
  resources :podcast_details
  resources :podcasts
  resources :sundays
  resources :saturdays
  resources :fridays
  resources :thursdays
  resources :wednesdays
  resources :tuesdays
  resources :numbers
  resources :mondays
  resources :sidebars
  resources :issues
  resources "contacts", only: [:new, :create]


  get 'welcome/index'

  match "/moonvibeguide", to: "moon_vibe_guide#index", :via => 'get'
  match "/moonvibeguide/issues", to: "moon_vibe_guide#issues", :via => 'get'
  match "/moonvibeguide/issue/:id", to: "moon_vibe_guide#issue", :via => 'get', :as => 'moonvibeguide_issue'
  match "/moonvibeguide/reading/:id", to: "moon_vibe_guide#reading", :via => 'get', :as => 'moonvibeguide_reading'
  match "/moonvibeguide/view_reading/:id", to: "moon_vibe_guide#view_reading", :via => 'get', :as => 'moonvibeguide_view_reading'
    
  match "/blog", to: "blog#index", :via => 'get'
  get '/comments/new/(:post_id)/(:parent_id)', to: 'comments#new', as: :new_comment
  get '/posts/send_campaign/:id', to: 'posts#send_campaign', as: :send_campaign

  match "/admin/home", to: "admin_home#index", :via => 'get'

  match "/faq", to: "faqs#listing", :via => 'get', as: :list_faq

  match '/contact',     to: 'contacts#new',             via: 'get'
  

  devise_for :member, :path => '', :path_names => {  sign_in: 'login', sign_out: 'logout', sign_up: 'join', password: 'member_password', registration: 'member_registration' }, 
  controllers: { sessions: 'members/sessions', registrations: "members/registrations" }

  devise_scope :member do
    get 'login', to: 'members/sessions#new'
    get 'logout', to: 'members/sessions#destroy'
    get 'join', to: 'members/registrations#new'
  end

  get 'issues/index'
  get 'issues/new'
  get 'issues/create'
  get 'issues/show'
  get 'issues/edit'

  devise_for :admin, :path => '', :path_names => {  sign_in: 'admin', sign_out: 'logout_admin', sign_up: 'create_admin', password: 'password_admin', registration: 'register_admin' }, controllers: {
    sessions: 'admins/sessions', registrations: 'admins/registrations'
  }
  devise_scope :admin do
    get 'admin', to: 'admins/sessions#new'
    get 'logout_admin', to: 'admins/sessions#destroy'
  end

  mount Thredded::Engine => '/rainbowtribe'

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
