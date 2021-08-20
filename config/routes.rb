Rails.application.routes.draw do
  get '/', to: 'home#top'
  
  get 'users/acount', to: 'users#acount'
  get 'users/signup', to: 'users#signup'
  get 'users/signin', to: 'users#signin_form'
  post 'users/signup', to: 'users#create'
  post 'users/signin', to: 'users#signin'
  post 'logout', to: 'users#signout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
