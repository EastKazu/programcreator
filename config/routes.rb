Rails.application.routes.draw do
  root to: 'pieces#index'
  resources :pieces
  get 'search_pieces', to: 'pieces#search'
end
