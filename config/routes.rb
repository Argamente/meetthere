Rails.application.routes.draw do
  root to: 'homepage#index'

  match '/signin', to:'user_account#signinup', via:'get'
  match '/signup', to:'user_account#signinup', via:'get'
  match '/tosignin', to:'user_account#tosignin',via:'post'
  match '/tosignup', to:'user_account#tosignup', via:'post'
  match '/signout', to:'user_account#signout', via:'get'

  match '/search', to:'homepage#search', via:'post'

  match '/post', to:'story#post', via:'get'
  match '/topost', to:'story#topost',via:'post'
  match '/postmemory', to:'story#topost_memory', via:'post'

  match '/user/:id', to:'person#show', via:'get'

end
