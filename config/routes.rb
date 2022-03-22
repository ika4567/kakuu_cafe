Rails.application.routes.draw do

  namespace :admin do
    root to: 'homes#top'
  end

  namespace :admin do
    resources :orders, only: [:index]
  end

  namespace :admin do
    resources :customers, only: [:show]
  end

  namespace :admin do
    resources :products, only: [:index, :create, :edit, :update, :destroy]
    get 'products/sale' => 'products#sale'
  end

    scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
  end

  scope module: :public do
    resources :orders, only: [:new, :create, :index, :edit, :update]
    get 'orders/note'
    post 'orders/confirm'
    get 'orders/thanks'
  end

  scope module: :public do
    resource :customers, only: [:edit, :update]
    get 'customers/my_page' => 'customers#show', as: 'my_page'
    patch 'customers/cancel'
  end


  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
