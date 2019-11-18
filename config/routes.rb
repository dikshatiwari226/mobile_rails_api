Rails.application.routes.draw do
  resources :applied_jobs
  # devise_for :users

  root "home#index"

  namespace :api do
    namespace :v1 do
      # devise_scope :user do
        post "/sign_in", :to => 'sessions#create'
        delete "/sign_out", :to => 'sessions#destroy'
        post "/sign_up", :to => 'registrations#create'
        # get "/sign_up", :to => 'registrations#create'
        get "/users", :to => 'registrations#index'
        put "/update_account", :to => 'registrations#update'
        delete "user/delete", :to => 'registrations#destroy'
        # put '/change_password', to: 'registrations#change_password'
        # get "/profile", :to => 'registrations#profile'
        # get "/reset_password", :to => 'registrations#reset_password'
        # get "/reset_password_link", :to => 'registrations#reset_password_link'
      # end
    end
  end
  
end
