Rails.application.routes.draw do
  resources :parcours
  resources :domaines, only: :index

  resources :acheteurs, only: :index do
    resources :parcours
  end

  resource :guide do
    get :entreprise
    get :acheteur
    get :tuteur
    get :marche_notifie
    get :referent_entreprise
    get :preparation_marche
  end

  root to: "pages#accueil"

  get "parcours_a_suivre", to: "parcours_a_suivre#index"
end
