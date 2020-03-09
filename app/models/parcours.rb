class Parcours < ApplicationRecord
  belongs_to :referent_mlds, optional: true

  validates :date_notification_marche, presence: true
  validates :objet_detaille_marche, presence: true
  validates :nom_organisme_acheteur, presence: true

  scope :bientot_echus, -> {
    where("date_fin_clause_sociale::date <= ? AND date_fin_clause_sociale_reconduction_comprise is NULL", Date.today+6.months).or(les_2_dates_sont_bientot_echues).order(:date_fin_clause_sociale)
  }

  scope :les_2_dates_sont_bientot_echues, -> {
    where("date_fin_clause_sociale_reconduction_comprise::date <= :echeance AND date_fin_clause_sociale::date <= :echeance", echeance: Date.today+6.months)
  }

  scope :par_academie, -> (academie) {
    where(academie_parcours: academie)
  }

  scope :groupe_bientot_echus_par_academies, -> {
    select(:academie_parcours).where("id in (?)", (bientot_echus.ids)).group(:academie_parcours)
  }

  def date_fin_connue
    [date_fin_clause_sociale_reconduction_comprise, date_fin_clause_sociale].compact.max
  end

  def self.nombre_par_acheteur
    parcours_regroupes = {}
    select(:nom_organisme_acheteur).each do |parcours|
      nom_organisme = parcours.nom_organisme_acheteur.downcase.strip
      if parcours_regroupes[nom_organisme]
        parcours_regroupes[nom_organisme] << parcours
      else
        parcours_regroupes[nom_organisme] = [parcours]
      end
    end
    parcours_regroupes
  end

  def self.par_acheteur(acheteur)
    acheteur = acheteur.downcase.strip
    parcours_acheteur = []
    all.each do |parcours|
      nom_organisme = parcours.nom_organisme_acheteur.downcase.strip
      next if acheteur != nom_organisme
      parcours_acheteur << parcours
    end
    parcours_acheteur
  end

end
