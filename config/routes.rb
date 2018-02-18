Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'upcs#home'
  resources :upcs do
    get '/upload_products', to: 'upcs#upload_products'
    post '/import', to: 'upcs#import'
    resources :products
  end


  get '/wallet', to: 'upcs#index'
end
