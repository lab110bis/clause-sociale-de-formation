class CreateParcours < ActiveRecord::Migration[6.0]
  def change
    create_table :parcours do |t|
      t.string :nom_organisme_acheteur
      t.string :type_acheteur
      t.text :adresse_acheteur
      t.string :nom_prenom_contact_acheteur
      t.string :mail_contact_acheteur
      t.string :telephone_contact_acheteur
      t.text :objet_marche
      t.string :date_notification_marche
      t.string :date_fin_clause_sociale
      t.string :date_fin_clause_sociale_reconduction_comprise
      t.string :nom_entreprise
      t.string :secteur_activite_entreprise
      t.string :site_web_entreprise
      t.string :nom_prenom_referent_entreprise
      t.string :telephone_referent_entreprise
      t.string :fonction_referent_entreprise
      t.string :nom_prenom_2eme_referent_entreprise
      t.string :telephone_2eme_referent_entreprise
      t.string :fonction_2eme_referent_entreprise
      t.integer :heures_parcours
      t.text :adresse_parcours
      t.string :region_parcours
      t.string :departement_parcours
      t.string :academie_parcours
      t.string :domaine_activite_parcours
      t.string :details_taches_proposees_parcours
      t.string :autre_remarque

      t.timestamps
    end
  end
end
