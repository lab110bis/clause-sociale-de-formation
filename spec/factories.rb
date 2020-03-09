FactoryBot.define do
  factory :parcours do
    date_notification_marche { "03/01/2020" }
    objet_detaille_marche { "Marché de test" }
    nom_organisme_acheteur { "Acheteur de test" }
  end
end
