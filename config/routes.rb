TestApp::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations", :sessions => "users/sessions" }
  resources :comments do
    get :moderated, on: :member
  end
  resources :books
  resources :users
  get 'search' => 'search#index'
  root 'catalog#index'
end
