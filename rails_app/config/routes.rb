Rails.application.routes.draw do

  namespace :user_manager do
    resources :groups
    resources :users
    resources :membershiplevels
    get 'users/:id/pin_generator' => 'users#pin_generator', as: :pin_generator
    patch 'users/:id/generate_pin' => 'users#generate_pin', as: :generate_pin
    post 'membershiplevel/remove_user' => 'membershiplevels#remove_user', as: :membershiplevel_remove_user
    post 'membershiplevel/add_user' => 'membershiplevels#add_user', as: :membershiplevel_add_user
    get 'membershiplevel/:id/multiselect_users' => 'membershiplevels#multiselect_users', as: :membershiplevel_multiselect_users
    post 'membershiplevel/:id/set_users' => 'membershiplevels#set_users', as: :membershiplevel_set_users
  end

  namespace :media_time do
    resources :media_times
    get 'media_global_setting' => 'media_global_settings#show'
    get 'media_global_setting/edit' => 'media_global_settings#edit'
    patch 'media_global_setting.1' => 'media_global_settings#update'
    post 'logins/toggle' => 'logins#toggle_login', as: :logins_toggle
    get 'logins/login_display' => 'logins#login_display', as: :login_display
  end

  devise_for :users, controllers: {
    sessions: 'devise_users/sessions'
  }
  root to: 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
