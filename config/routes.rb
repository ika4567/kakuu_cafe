Rails.application.routes.draw do

  namespace :admin do
    root to: 'homes#top'
  end

  namespace :admin do
    get 'orders/index'
  end

  namespace :admin do
    get 'customers/show'
  end

  namespace :admin do
    get 'products/index'
    get 'products/sale'
    get 'products/edit'
  end

    scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
  end

  scope module: :public do
    get 'orders/note'
    get 'orders/new'
    get 'orders/thanks'
    get 'orders/index'
    get 'orders/edit'
  end

  scope module: :public do
    get 'customers/my_page' => 'customers#show', as: 'my_page'
    get 'customers/edit'
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
