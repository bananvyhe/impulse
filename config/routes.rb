Rails.application.routes.draw do
  
  resources :resizeimages
  resources :feedbacks
  
  get 'users/index'
  # devise_for :admins
  resources :sliders
  resources :news

  resources :teams
  resources :players
  
  # resources :players
  resources :employees
  get 'errors/not_found'
  get 'errors/internal_server_error'
  mount Ckeditor::Engine => '/ckeditor'
  resources :programms
  resources :contacts
  devise_for :users, controllers: {
        sessions: 'users/sessions'
  }
  resources :users do
    get :admination, on: :member
    get :deadmination, on: :member
  end
  # , controllers: { registrations: 'registrations' }
  resources :katbibs 
  resources :reviews
  resources :katbib2s
  resources :libraries
	root 'pages#main'
	get 'admin' => 'pages#admin'
	match "/404", :to => "errors#not_found", :via => :all
	match "/500", :to => "errors#internal_server_error", :via => :all
	 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
