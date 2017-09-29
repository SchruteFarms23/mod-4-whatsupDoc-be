Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
post '/users', to: 'users#create'
post '/login', to: 'auth#create'
get '/users/me', to: 'users#me'
get 'welcome', to: 'application#welcome'

end
