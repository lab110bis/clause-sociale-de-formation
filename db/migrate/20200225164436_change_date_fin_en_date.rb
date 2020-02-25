class ChangeDateFinEnDate < ActiveRecord::Migration[6.0]
  def change
    change_column :parcours, :date_fin_clause_sociale, :date, using: "date_fin_clause_sociale::date"
    change_column :parcours, :date_fin_clause_sociale_reconduction_comprise, :date, using: "date_fin_clause_sociale::date"
    change_column :parcours, :date_notification_marche, :date, using: "date_fin_clause_sociale::date"
  end
end
