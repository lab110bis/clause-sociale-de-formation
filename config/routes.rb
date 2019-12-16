Rails.application.routes.draw do
  resources :parcours
  root to: "pages#accueil"
end
