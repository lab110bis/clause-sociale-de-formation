require "rails_helper"

describe Parcours, type: :model do

  it "nombre par acheteur retourne un tableau vide quand il n'y a pas de parcours" do
    expect(Parcours.nombre_par_acheteur).to be_empty
  end

  it "nombre par acheteur retourne le parcours d'un acheteur" do
    parcours = create(:parcours, nom_organisme_acheteur: "acheteur")
    attendu = {"acheteur" => 1}
    expect(Parcours.nombre_par_acheteur).to eq(attendu)
  end

  it "nombre par acheteur retourne les parcours d'un acheteur" do
    parcours = create(:parcours, nom_organisme_acheteur: "acheteur")
    autre_parcours = create(:parcours, nom_organisme_acheteur: "acheteur")
    attendu = {"acheteur" => 2}
    expect(Parcours.nombre_par_acheteur).to eq(attendu)
  end

  it "nombre par acheteur retourne les parcours regroupé par acheteur" do
    parcours = create(:parcours, nom_organisme_acheteur: "acheteur")
    autre_parcours = create(:parcours, nom_organisme_acheteur: "acheteur")
    parcours_autre_acheteur = create(:parcours, nom_organisme_acheteur: "autre organisme")
    attendu = { "acheteur" => 2, "autre organisme" => 1 }
    expect(Parcours.nombre_par_acheteur).to eq(attendu)
  end

  it "nombre par acheteur considère que Pole emploi et POLE EMPLOI sont le même acheteur" do
    parcours_Pole_emploi = create(:parcours, nom_organisme_acheteur: "Pole emploi")
    parcours_POLE_EMPLOI = create(:parcours, nom_organisme_acheteur: "POLE EMPLOI")
    attendu = {"pole emploi" => 2}
    expect(Parcours.nombre_par_acheteur).to eq(attendu)
  end

  it "nombre par acheteur ne considère pas les espaces autour du nom" do
    parcours_sans_espace = create(:parcours, nom_organisme_acheteur: "acheteur")
    parcours_avec_espace = create(:parcours, nom_organisme_acheteur: "acheteur ")
    attendu = {"acheteur" => 2}
    expect(Parcours.nombre_par_acheteur).to eq(attendu)
  end

end
