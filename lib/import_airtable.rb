require "csv"

CSV.foreach("import_airtable.csv", headers: true) do |row|
  Parcours.create(
    nom_organisme_acheteur: ,
    type_acheteur: ,
    adresse_acheteur: ,
    nom_prenom_contact_acheteur: ,
    mail_contact_acheteur: ,
    telephone_contact_acheteur: ,
    objet_marche: ,
    date_notification_marche: ,
    date_fin_clause_sociale: ,
    date_fin_clause_sociale_reconduction_comprise: ,
    nom_entreprise: row[1], # Nom de l'entreprise titulaire
    secteur_activite_entreprise: row[2], # Secteur d'activité de l'entreprise
    site_web_entreprise: row[3],
    nom_prenom_referent_entreprise: ,
    telephone_referent_entreprise: ,
    fonction_referent_entreprise: ,
    nom_prenom_2eme_referent_entreprise: ,
    telephone_2eme_referent_entreprise: ,
    fonction_2eme_referent_entreprise: ,
    heures_parcours: row[4],
    adresse_parcours: row[5],
    region_parcours: ,
    departement_parcours: ,
    academie_parcours: ,
    domaine_activite_parcours: ,
    details_taches_proposees_parcours: ,
    autre_remarque: ,
    created_at: row[0], precision: 6, null: false, # Date d'ajout du parcours
    updated_at: ,, precision: 6, null: false
    referent_mlds_id: ,



end
