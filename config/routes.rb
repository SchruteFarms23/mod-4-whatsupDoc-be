Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
post '/users', to: 'users#create'
post '/login', to: 'auth#create'
get '/users/me', to: 'users#me'
post '/users/me', to: 'users#mydoctors'
patch '/users/add', to: 'users#update'
get '/welcome', to: 'application#welcome'
get '/doctors', to: 'doctors#index'
get '/docs', to: 'users#get_doctors'

end
