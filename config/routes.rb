Automoto::Application.routes.draw do
  

  resources :boards do 
    resources :conversations
  end

  resources  :users
  resources  :sessions,   :only  => [:new, :create, :destroy]
  resources :articles,   :only  => [:create, :destroy] 
  
  root :to => 'pages#home'
  
  match '/contact',    :to => 'pages#contact'
  match '/about',      :to => 'pages#about'
  match '/admin',      :to => 'pages#admin'
  match '/register',   :to => 'users#new'
  match '/users/intervenant',    :to => 'users#intervenant'
  
  match '/signin',     :to => 'sessions#new'
  match '/signout',    :to => 'sessions#destroy'
  match '/forum',      :to => 'boards#index'

  get '/forum/:board_id/conversations/:id/reply' => "conversations#reply", :as => :reply_board_conversation
  post '/forum/:board_id/conversations/:id/reply' => "conversations#save_reply", :as => :reply_board_conversation
end
