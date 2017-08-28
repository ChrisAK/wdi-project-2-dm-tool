# frozen_string_literal: true
Rails.application.routes.draw do
  resources :encounters, except: [:new, :edit]
  resources :campaigns, except: [:new, :edit]
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show] do
    resources :campaigns do
      resources :encounters
    end
  end
end
