Rails.application.routes.draw do
  resources :parcours
  root to: "pages#accueil"
  get "entreprise", to: "pages#entreprise"
end
