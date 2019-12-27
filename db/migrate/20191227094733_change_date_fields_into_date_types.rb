class ChangeDateFieldsIntoDateTypes < ActiveRecord::Migration[6.0]
  def change
    change_table :parcours do |t|
      t.change :details_taches_proposees_parcours, :text
      t.change :autre_remarque, :text
    end
  end
end
