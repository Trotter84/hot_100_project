Rails.application.routes.draw do
  root 'billboards#index'
  
  resources :billboards

  get "/billboards/:billboard_id/song/:id/like", to: 'songs#like', as: 'like'

  resources :artists do
    resources :songs, except: [:index, :show]
  end
end
