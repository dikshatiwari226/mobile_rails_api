Rails.application.routes.draw do
  resources :businesses
  post '/edit/:id', to: 'businesses#update'
  get '/delete/:id', to: 'businesses#destroy'
  
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  # root "home#index"

  # post 'auth/request', to:'businesses#get_authorization'

  namespace :api do
    namespace :v1 do
      # devise_scope :user do
        resources :applied_jobs
        resources :job_informations
        post "/sign_in", :to => 'sessions#create'
        delete "/sign_out", :to => 'sessions#destroy'
        post "/sign_up", :to => 'registrations#create'
        put "/update_account", :to => 'registrations#update'
        delete "user/delete", :to => 'registrations#destroy'
        get "search", :to => 'jobinformations#search'
        get "/profile", :to => 'registrations#profile'
        post "/edit_profile", :to => 'registrations#edit_profile'
        post "/current_user_update_image", :to => 'registrations#current_user_update_image'
        post "/users", :to => 'users#index'
        get "/showUser/:id", :to=> 'users#show'
        post "/editUser/:id", :to=> 'users#update'
        get "/delete/:id", :to => 'users#destroy'
        post "/fileupload", :to => 'users#create'
        post "/change_password", :to => 'users#change_password'
        post "/forgot", :to => 'sessions#forgot'
        # post "auth/google_login", :to => 'sessions#get_authorization'
        # get "/showAppliedJob/:id", :to => 'applied_jobs#show'
      # end
    end
  end

    
  
end
