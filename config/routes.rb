Rails.application.routes.draw do
  root to: 'homepage#index'

  match '/signin', to:'user_account#signinup', via:'get'
  match '/signup', to:'user_account#signinup', via:'get'
  match '/tosignin', to:'user_account#tosignin',via:'post'
  match '/tosignup', to:'user_account#tosignup', via:'post'

  match '/search', to:'homepage#search', via:'post'
end
