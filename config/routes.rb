Rails.application.routes.draw do

  match "main/list", to: "main#list", as: "main_list", via: [:get, :post]
  match "main/count/phrases", to: "main#count_phrases", as: "count_phrases", via: [:get, :post]
  match "main/get/phrases", to: "main#get_phrases", as: "get_phrases", via: [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
