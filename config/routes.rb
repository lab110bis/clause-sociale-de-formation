Rails.application.routes.draw do
  resources :parcours
  resources :domaines, only: :index
  root to: "pages#accueil"

  get "entreprise", to: "pages#entreprise"
  get "preparation_marche", to: "pages#preparation_marche"
  get "marche_notifie", to: "pages#marche_notifie"
  get "referent_entreprise", to: "pages#referent_entreprise"
  get "acheteur", to: "pages#acheteur"
  get "tuteur", to: "pages#tuteur"
  get "parcours_a_suivre", to: "parcours_a_suivre#index"
end
