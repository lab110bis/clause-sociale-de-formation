class AddReferentMldsToParcours < ActiveRecord::Migration[6.0]
  def change
    add_column :parcours, :referent_mlds_id, :integer, null: true
  end
end
