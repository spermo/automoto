Automoto::Application.routes.draw do
  
  root :to => 'pages#home'
  get "pages/home"

  get "pages/contact"

  get "pages/about"

  
  
end
