Rails.application.routes.draw do
  use_doorkeeper do
    controllers :applications => 'oauth/applications'
  end
  devise_for :users, controllers: { sessions: "users/sessions" }, only: :sessions

  root 'home#index'
  get "/users" => "users#index", as: :users

  resources :users, only: [:edit, :update] do
    put "/password" => "users#update_password", as: :update_password
    get "/password" => "users#edit_password"
    get "/profile"  => "users#profile", as: :profile
  end

  get '/soon' => "home#coming_soon", as: :soon

  namespace :api do
    namespace :v1 do
      get '/me' => 'api#me'
    end
  end

  get '/calendar' => 'calendar#index', as: :calendar

  get '/clubs' => 'clubs#news', as: :clubs
  get '/clubs/list' => 'clubs#list', as: :clubs_list
  get '/clubs/list_private' => 'clubs#list_private', as: :clubs_list_private
  get '/clubs/subscribe' => 'clubs#subscribe', as: :clubs_subscribe
  get '/clubs/join' => 'clubs#join', as: :clubs_join
  #get '/club/creerclub' => 'club#creerclub', as: :creerclub
  get '/clubs/profile' => 'clubs#profile', as: :clubs_profile
  get '/clubs/article' => 'clubs#article', as: :clubs_article
  get '/clubs/article/new' => 'clubs#new_article', as: :new_article

  resources :clubs
  resources :article


  get '/files/*path' => 'files#index', as: :files
  get '/files' => 'files#index', as: :base_files

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
