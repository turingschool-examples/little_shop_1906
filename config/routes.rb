Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get    '/merchants',          to: 'merchants#index'
  get    '/merchants/new',      to: 'merchants#new'
  get    '/merchants/:id',      to: 'merchants#show'
  post   '/merchants',          to: 'merchants#create'
  get    '/merchants/:id/edit', to: 'merchants#edit'
  patch  '/merchants/:id',      to: 'merchants#update'
  delete '/merchants/:id',      to: 'merchants#destroy'

  get    '/',                                 to: 'items#index'
  get    '/items',                            to: 'items#index'
  get    '/items/:id',                        to: 'items#show'
  get    '/items/:id/edit',                   to: 'items#edit'
  patch  '/items/:id',                        to: 'items#update'
  get    '/merchants/:merchant_id/items',     to: 'items#index'
  get    '/merchants/:merchant_id/items/new', to: 'items#new'
  post   '/merchants/:merchant_id/items',     to: 'items#create'
  delete '/items/:id',                        to: 'items#destroy'

  get    '/reviews/:id/edit',           to: 'reviews#edit'
  patch  '/reviews/:id',                to: 'reviews#update'
  get    '/items/:item_id/reviews/new', to: 'reviews#new'
  post   '/items/:item_id/reviews',     to: 'reviews#create'
  delete '/reviews/:id',                to: 'reviews#destroy'

  get    '/cart',          to: 'cart#show'
  patch  '/cart/:item_id', to: 'cart#update'
  delete '/cart',          to: 'cart#destroy'
  delete '/cart/:item_id', to: 'cart#destroy'

  get    '/orders/new',                      to: 'orders#new'
  get    '/orders/:id',                      to: 'orders#show'
  post   '/orders',                          to: 'orders#create'
  delete '/orders/:id',                      to: 'orders#destroy'
  delete '/orders/:order_id/items/:item_id', to: 'orders#destroy'

  get '/verified_order', to: 'orders#show'

  patch '/users/:id', to: 'users#update'
end
