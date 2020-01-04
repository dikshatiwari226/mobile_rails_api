Rails.application.routes.draw do
  resources :businesses
  post '/edit/:id', to: 'businesses#update'
  get '/delete/:id', to: 'businesses#destroy'
  
  # devise_for :users

  root "home#index"


  namespace :api do
    namespace :v1 do
      # devise_scope :user do
        resources :applied_jobs
        resources :job_informations
        post "/sign_in", :to => 'sessions#create'
        delete "/sign_out", :to => 'sessions#destroy'
        post "/sign_up", :to => 'registrations#create'
        post "/users", :to => 'registrations#index'
        put "/update_account", :to => 'registrations#update'
        delete "user/delete", :to => 'registrations#destroy'
        get "search", :to => 'jobinformations#search'
        # put '/change_password', to: 'registrations#change_password'
        get "/profile", :to => 'registrations#profile'
        post "/edit_profile", :to => 'registrations#edit_profile'
        # get "/reset_password", :to => 'registrations#reset_password'
        # get "/reset_password_link", :to => 'registrations#reset_password_link'
      # end
    end
  end

    
  
end
