Rails.application.routes.draw do
  root 'notes#index'
  resource :notes, only: [:new, :create]
  get 'notes/:id', to: 'notes#show', as: 'note'
  get 'notes/:id/edit', to: 'notes#edit', as: 'edit_note'
  patch 'notes/:id', to: 'notes#update'
end
