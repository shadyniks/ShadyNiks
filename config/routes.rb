Rails.application.routes.draw do

  get '/', to: redirect('/articles')
  
  get 'admin', to: 'admin#index'

  get '/articles/all', to: 'articles#all'
  resources :articles

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
