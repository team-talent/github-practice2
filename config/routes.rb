Rails.application.routes.draw do


  namespace :managers do
    get "homes", to: "homes#top"

      devise_for :staffs, controllers: {
      sessions: 'managers/staffs/sessions',
      registrations: 'managers/staffs/registrations',
      passwords: 'managers/staffs/passwords'
    }
      resources :customers, only:[:index, :show, :edit, :update]
      resources :products, only:[:index, :show, :new, :edit, :create, :update]
      resources :genres, only:[:index, :edit, :create, :update]
      resources :orders, only:[:index, :show]
  end

  scope module: 'customers' do
    root "homes#home"
    get "/homes/thanks", to: "homes#thanks"
    get "/homes/about", to: "homes#about"

      devise_for :customers, controllers: {
        sessions: 'customers/customers/sessions',
        registrations: 'customers/customers/registrations',
        passwords: 'customers/customers/passwords'
      }
      resource :customers, only:[:show, :edit, :update]
      resources :products, only:[:index, :show]
      resources :destinations, only:[:index, :edit, :create, :update, :destroy]
      resources :orders, only:[:index, :show, :new, :create]
      resources :carts, only:[:show, :create, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
