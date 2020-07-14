Rails.application.routes.draw do
	get 'homes/top'
	get 'homes/about'
	devise_for :users,except:[:edit]
	resources :users, only: [:edit, :show]
	root 'homes#top'
    resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
