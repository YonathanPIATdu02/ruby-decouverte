Rails.application.routes.draw do
  resources :remove_marque_form_voitures
  resources :marques
  resources :personnes
  resources :voitures
  get 'voitures/immatriculation/:imat', to: 'voitures#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
