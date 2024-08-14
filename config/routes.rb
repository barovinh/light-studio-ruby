Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  get "/contact", to: "root#contact"
  get "/product", to: "product#index", as: 'product'
  get "product/details/:id", to: "product#details"
  # Defines the root path route ("/")
  root "root#index"
  
end
