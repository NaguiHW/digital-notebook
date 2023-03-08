Rails.application.routes.draw do
  root "notes#index"
  resource :notes, only: %i[ new create ]
end
