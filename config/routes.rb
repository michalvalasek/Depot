Depot::Application.routes.draw do

  get "admin/index"

	get 'admin' => 'admin#index'

	get "store/index"

	controller :sessions do
	  get 'login' => :new
	  post 'login' => :create
	  delete 'logout' => :destroy
  end

	resources :users

  resources :orders

  resources :line_items

  resources :carts

  resources :products do
	  get :who_bought, :on => :member
  end
  
  resources :line_items do
    post 'decrement', :on => :member
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'store#index', :as => 'store'

  # See how all your routes lay out with "rake routes"
end
