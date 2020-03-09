require "rails_helper"

describe Parcours, type: :model do

  it "par acheteur renvoie un tableau si l'acheteur n'a pas de parcours" do
    expect(Parcours.par_acheteur("acheteur sans parcours")).to eq([])
  end

  it "par acheteur retourne le parcours de l'acheteur" do
    parcours = create(:parcours, nom_organisme_acheteur: "acheteur")
    parcours_autre_acheteur = create(:parcours, nom_organisme_acheteur: "autre organisme")
    expect(Parcours.par_acheteur("acheteur")).to eq([parcours])
  end

end
