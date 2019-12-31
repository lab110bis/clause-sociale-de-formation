# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_31_142319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parcours", force: :cascade do |t|
    t.string "nom_organisme_acheteur"
    t.string "type_acheteur"
    t.text "mail_referent_entreprise"
    t.string "nom_prenom_contact_acheteur"
    t.string "mail_contact_acheteur"
    t.string "telephone_contact_acheteur"
    t.text "objet_marche"
    t.string "date_notification_marche"
    t.string "date_fin_clause_sociale"
    t.string "date_fin_clause_sociale_reconduction_comprise"
    t.string "nom_entreprise"
    t.string "secteur_activite_entreprise"
    t.string "site_web_entreprise"
    t.string "nom_prenom_referent_entreprise"
    t.string "telephone_referent_entreprise"
    t.string "fonction_referent_entreprise"
    t.string "nom_prenom_2eme_referent_entreprise"
    t.string "telephone_2eme_referent_entreprise"
    t.string "fonction_2eme_referent_entreprise"
    t.integer "heures_parcours"
    t.text "adresse_parcours"
    t.string "region_parcours"
    t.string "departement_parcours"
    t.string "academie_parcours"
    t.string "domaine_activite_parcours"
    t.text "details_taches_proposees_parcours"
    t.text "autre_remarque"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "referent_mlds_id"
    t.string "mail_2eme_referent_entreprise"
  end

  create_table "referents_mlds", force: :cascade do |t|
    t.string "nom"
  end

end
