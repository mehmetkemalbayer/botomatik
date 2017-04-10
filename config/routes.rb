Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/blocks/galery/new', to: "blocks#new_galery"
  get '/blocks/text/new', to: "blocks#new_text"
  post '/blocks', to: "blocks#create"
end
