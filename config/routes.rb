Automoto::Application.routes.draw do
  
  root :to => 'pages#home'
  # get "pages/home"
  #   get "pages/contact"
  #   get "pages/about"
  
  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'


  
  
end
