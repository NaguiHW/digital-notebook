Rails.application.routes.draw do
  root 'notes#index'
  resource :notes, only: [:new, :create]
  get 'notes/:id', to: 'notes#show', as: 'note'
end
