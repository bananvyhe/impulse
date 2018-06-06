Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :programms
  resources :contacts
  devise_for :users
	root 'pages#main'
	 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
