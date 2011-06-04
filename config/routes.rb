Automoto::Application.routes.draw do
  
  get "users/new"

  root :to => 'pages#home'
  
  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'


  
  
end
