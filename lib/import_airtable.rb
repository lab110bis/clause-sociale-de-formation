require "csv"

CSV.foreach("import_airtable.csv", headers: true) do |row|
  Parcours.create!(
    nom_organisme_acheteur: row[26],
    type_acheteur: row[27],
    nom_prenom_contact_acheteur: row[28],
    mail_contact_acheteur: row[29],
    telephone_contact_acheteur: row[30],
    objet_marche: row[31],
    date_notification_marche: row[32],
    date_fin_clause_sociale: row[33],
    date_fin_clause_sociale_reconduction_comprise: nil,
    nom_entreprise: row[1], # Nom de l'entreprise titulaire
    secteur_activite_entreprise: row[2], # Secteur d'activité de l'entreprise
    site_web_entreprise: row[3],
    nom_prenom_referent_entreprise: row[18],
    mail_referent_entreprise: row[19],
    telephone_referent_entreprise: row[20],
    fonction_referent_entreprise: row[21],
    nom_prenom_2eme_referent_entreprise: row[22],
    mail_2eme_referent_entreprise: row[23],
    telephone_2eme_referent_entreprise: row[24],
    fonction_2eme_referent_entreprise: row[25],
    heures_parcours: row[4],
    adresse_parcours: row[5],
    region_parcours: row[7],
    departement_parcours: row[8],
    academie_parcours: row[6],
    domaine_activite_parcours: row[9],
    details_taches_proposees_parcours: row[10],
    autre_remarque: row[11],
    created_at: row[0]
  )



end
