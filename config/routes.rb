Rails.application.routes.draw do
  root to: 'home#top'
  
  get 'reservations', to: 'reservations#index'
  get 'reservations/:id', to: 'reservations#show', as: 'reservations_show'
  post 'reservations/:id', to: 'reservations#create'
  
  get 'rooms/search', to: 'rooms#search', as: 'search_rooms'
  get 'rooms/posts', to: 'rooms#posts'
  post 'rooms/:id', to: 'reservations#confirm'
  resources :rooms, only: [:new, :create, :show]
  
  get 'users/account', to: 'users#account'
  get 'users/profile', to: 'users#profile_edit'
  post 'users/profile', to: 'users#profile_update'
  patch 'users/profile', to: 'users#profile_update'
  get 'users/edit', to: 'users#edit'
  post 'users/edit', to: 'users#update'
  patch 'users/edit', to: 'users#update'
  get 'users/signup', to: 'users#signup'
  get 'users/signin', to: 'users#signin_form'
  post 'users/signup', to: 'users#create'
  post 'users/signin', to: 'users#signin'
  post 'logout', to: 'users#signout'
end
