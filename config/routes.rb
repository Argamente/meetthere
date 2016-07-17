Rails.application.routes.draw do
  root to: 'homepage#index'

  match '/signin', to:'user_account#signinup', via:'get'
  match '/signup', to:'user_account#signinup', via:'get'
end
