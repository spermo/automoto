Automoto::Application.routes.draw do
  
  match '/', :to => 'pages#home'
  get "pages/home"

  get "pages/contact"

  get "pages/about"

  
  
end
