class Parcours < ApplicationRecord
  belongs_to :referent_mlds, optional: true
  validates :date_notification_marche, presence: true
  validates :objet_detaille_marche, presence: true

  scope :bientot_echus, -> {
    where("date_fin_clause_sociale::date <= ? AND date_fin_clause_sociale_reconduction_comprise is NULL", Date.today+6.months).or(bientot_echus_reconduction_comprise).order(:date_fin_clause_sociale)
  }

  scope :bientot_echus_reconduction_comprise, -> {
    where("date_fin_clause_sociale_reconduction_comprise::date <= ?", Date.today+6.months)
  }

end
