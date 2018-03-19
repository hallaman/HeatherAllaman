Rails.application.routes.draw do

  root 'welcome#index'

  resources :thredded_post_likes do
    put "upvote", to: "post_likes#upvote"
  end
  resources :thredded_topic_likes do
    put "upvote", to: "topic_likes#upvote"
  end
  resources :users
  resources :faqs
  resources :pages
  resources :testimonials
  resources :newsbars
  resources :posts do
    put "like", to: "posts#upvote"
    resources :comments, only: [:index, :create] do 
      put "like", to: "comments#upvote"
    end
  end
  resources :media
  resources :sidebars
  resources :issues
  resources "contacts", only: [:new, :create]

  get 'welcome/index', as: :welcome

  match "/blog", to: "blog#index", :via => 'get'
  get '/comments/new/(:post_id)/(:parent_id)', to: 'comments#new', as: :new_comment
  get '/posts/send_campaign/:id', to: 'posts#send_campaign', as: :send_campaign

  match "/admin/home", to: "admin_home#index", :via => 'get'

  match "/faq", to: "faqs#listing", :via => 'get', as: :list_faq

  match '/contact',     to: 'contacts#new',             via: 'get'

  devise_for :admin, :path => '', :path_names => {  sign_in: 'admin', sign_out: 'logout_admin', sign_up: 'create_admin', password: 'password_admin', registration: 'register_admin' }, controllers: {
    sessions: 'admins/sessions', registrations: 'admins/registrations'
  }
  devise_scope :admin do
    get 'admin', to: 'admins/sessions#new'
    get 'logout_admin', to: 'admins/sessions#destroy'
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
