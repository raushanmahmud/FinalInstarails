Rails.application.routes.draw do
 
	get "/contact", to: "pages#contact"
	get "/about", to: "pages#about"
	root "pages#index"
	resources :users 
	get "/signup", to: "users#new"

	get "/login", to: "sessions#new"
	post "/login", to: "sessions#create"
	delete "/logout", to: "sessions#destroy"

	resources :posts, only: [:create, :destroy]
	# resources :likes, only: [:create]
	post "/like", to: "likes#create"
	delete "/unlike", to: "likes#destroy"

	post "/follow", to: "relationships#create"
	delete "/unfollow", to: "relationships#destroy"
end
