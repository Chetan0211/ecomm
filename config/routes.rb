Rails.application.routes.draw do
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  authenticated :admin_user do
    root to: "admin#index", as: :admin_root
  end

  get "admin" => "admin#index"
  get "categories" => "admin/category#index", as: :admin_categories
  get "new_category" => "admin/category#new", as: :admin_new_category
  post "create_category" => "admin/category#create", as: :admin_create_category
  get "show_category/:id" => "admin/category#show", as: :admin_show_category
  delete "delete_category/:id" => "admin/category#delete", as: :admin_delete_category
  get "edit_category/:id" => "admin/category#edit", as: :admin_edit_category
  patch "update_category/:id" => "admin/category#update", as: :admin_update_category
end
