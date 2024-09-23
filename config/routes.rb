Rails.application.routes.draw do
  root to: 'home#index'
  resources :pieces
  get 'search_pieces', to: 'pieces#search'
  get 'search_results', to: 'pieces#search_results'
end
