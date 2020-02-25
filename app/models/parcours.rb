class Parcours < ApplicationRecord
  belongs_to :referent_mlds, optional: true
  validates :date_notification_marche, presence: true

  def self.bientot_echus
    Parcours.where("date_fin_clause_sociale::date <= ?", Date.today+6.months).order(:date_fin_clause_sociale)
  end

end
