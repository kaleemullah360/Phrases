Rails.application.routes.draw do

	root "main#list"
  match "main/list", to: "main#list", as: "main_list", via: [:get, :post]
  match "main/count/phrases", to: "main#count_phrases", as: "count_phrases", via: [:get, :post]
  match "main/get/phrases", to: "main#get_phrases", as: "get_phrases", via: [:get, :post]
  match "main/get/history", to: "main#phrases_history", as: "phrases_history", via: [:get, :post]
  match "main/clear/history", to: "main#clear_history", as: "clear_history", via: [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
