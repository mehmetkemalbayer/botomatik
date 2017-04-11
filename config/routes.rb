Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'  
  get '/blocks/galery/new', to: "blocks#new_galery"
  get '/blocks/galery/:id/edit', to: "blocks#edit_galery", as: "edit_galery_block"
  get '/blocks/text/new', to: "blocks#new_text"
  get '/blocks/text/:id/edit', to: "blocks#edit_text", as: "edit_text_block"
  post '/blocks', to: "blocks#create"
  patch '/blocks/:id', to: "blocks#edit", as: "update_block"
  delete '/blocks/:id', to: "blocks#destroy", as: "destroy_block"
  delete '/blocks/:id/quick_replies/:quick_reply_id', to: "blocks#destroy_quick_reply", as: "destroy_blocks_quick_reply"
end
