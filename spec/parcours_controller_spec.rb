require "rails_helper"

describe ParcoursController, type: :controller do
  it 'filter sur les domaines' do
    parcours_comptable = create(:parcours, domaine_activite_parcours: "Comptabilité")
    parcours_autre = create(:parcours, domaine_activite_parcours: "Autre domaine")
    get :index, params: {domaine: "Comptabilité"}
    expect(Parcours.where(domaine_activite_parcours: "Comptabilité")).to eq([parcours_comptable])
    expect(assigns(:parcours)).to eq([parcours_comptable])
    expect(assigns(:titre_parcours)).to eq("Comptabilité")
  end
end
