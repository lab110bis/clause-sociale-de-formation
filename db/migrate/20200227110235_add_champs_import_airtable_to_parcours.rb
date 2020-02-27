class AddChampsImportAirtableToParcours < ActiveRecord::Migration[6.0]
  def change
    add_column :parcours, :objet_detaille_marche, :text, null: false
    add_column :parcours, :commentaires, :text, null: true
    add_column :parcours, :disponibilite_parcours, :string, null: true
    add_column :parcours, :suivis_parcours, :string, null: true
    add_column :parcours, :convention_signee, :string, null: true
  end
end
