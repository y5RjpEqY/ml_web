Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get 'uec', to: "static_pages#uec"
  get 'meiji', to: "static_pages#meiji"
  get 'aogaku', to: "static_pages#aogaku"
  resources :image_files
end
