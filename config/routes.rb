Rails.application.routes.draw do
  root 'notes#index'
  resource :notes, only: [:new, :create]
end
