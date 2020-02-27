require "csv"

CSV.foreach("import_airtable.csv", headers: true).with_index(2) do |cells, numero_ligne|
  begin
    referent_mlds = ReferentMlds.where(nom: cells[14]).first_or_create
    Parcours.where(nom_entreprise:  cells[1], nom_organisme_acheteur: cells[26], objet_detaille_marche: cells[32]).first_or_create!(
      referent_mlds: referent_mlds,
      created_at: cells[0],
      nom_entreprise: cells[1], # Nom de l'entreprise titulaire
      secteur_activite_entreprise: cells[2], # Secteur d'activité de l'entreprise
      site_web_entreprise: cells[3],
      heures_parcours: cells[4],
      adresse_parcours: cells[5],
      academie_parcours: cells[6],
      region_parcours: cells[7],
      departement_parcours: cells[8],
      domaine_activite_parcours: cells[9],
      details_taches_proposees_parcours: cells[10],
      autre_remarque: cells[11],
      disponibilite_parcours: cells[13],
      suivis_parcours: cells[16],
      convention_signee: cells[17],
      nom_prenom_referent_entreprise: cells[18],
      mail_referent_entreprise: cells[19],
      telephone_referent_entreprise: cells[20],
      fonction_referent_entreprise: cells[21],
      nom_prenom_2eme_referent_entreprise: cells[22],
      mail_2eme_referent_entreprise: cells[23],
      telephone_2eme_referent_entreprise: cells[24],
      fonction_2eme_referent_entreprise: cells[25],
      nom_organisme_acheteur: cells[26],
      type_acheteur: cells[27],
      nom_prenom_contact_acheteur: cells[28],
      mail_contact_acheteur: cells[29],
      telephone_contact_acheteur: cells[30],
      objet_marche: cells[31],
      objet_detaille_marche: cells[32],
      date_notification_marche: cells[33],
      date_fin_clause_sociale: cells[34],
      date_fin_clause_sociale_reconduction_comprise: cells[35],
      commentaires: cells[36]
    )
    rescue StandardError => error
      STDERR.puts "ligne #{numero_ligne} : #{error.message}"
      STDERR.puts "#{cells[1]} #{cells[26]}, #{cells[32]}"
  end

end
