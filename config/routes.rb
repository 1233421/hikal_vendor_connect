Rails.application.routes.draw do
  resources :vendor_types
  resources :departments
  resources :sub_vendor_types
  resources :entities
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  
  get "/vendors", to: "vendors#index"
  get "/vendors/submit", to: "vendors#submit"
  get "/employees/view_approval/:id", to: "employees#view_approval"
  get "/employees", to: "employees#index"
  get "/employees/invite", to: "employees#invite"
  post "/employees/invite", to: "employees#create_vendor"
  get "/send_mail", to: "employees#send_mail"
  
  get "/admins", to: "admins#index"
  
  resources :vendor_applications
  root to: "home#index"
end
