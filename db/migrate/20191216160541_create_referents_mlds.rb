class CreateReferentsMlds < ActiveRecord::Migration[6.0]
  def change
    create_table :referents_mlds do |t|
      t.string :nom
    end
  end
end
