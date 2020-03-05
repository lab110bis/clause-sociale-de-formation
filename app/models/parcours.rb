class Parcours < ApplicationRecord
  belongs_to :referent_mlds, optional: true
  validates :date_notification_marche, presence: true
  validates :objet_detaille_marche, presence: true

  scope :bientot_echus, -> {
    where("date_fin_clause_sociale::date <= ? AND date_fin_clause_sociale_reconduction_comprise is NULL", Date.today+6.months).or(les_2_dates_sont_bientot_echues).order(:date_fin_clause_sociale)
  }

  scope :les_2_dates_sont_bientot_echues, -> {
    where("date_fin_clause_sociale_reconduction_comprise::date <= :echeance AND date_fin_clause_sociale::date <= :echeance", echeance: Date.today+6.months)
  }

  def date_fin_connue
    [date_fin_clause_sociale_reconduction_comprise, date_fin_clause_sociale].compact.max
  end

end
