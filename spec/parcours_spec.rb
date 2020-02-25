require "rails_helper"

describe Parcours, type: :model do
  it 'should have date_notification_marche' do
    expect(Parcours.new).to be_invalid
    expect(Parcours.new date_notification_marche: "25/12/2020").to be_valid
  end

  it 'a une fabrique valide' do
    expect(build(:parcours)).to be_valid
  end

  it "bientot_echus renvoie un tableau vide quand aucun parcours n'existe" do
    expect(Parcours.bientot_echus).to be_empty
  end

  it "bientot_echus renvoie les parcours échus dans moins de 6 moins" do
    parcours_bientot_echus = create(:parcours, date_fin_clause_sociale: (Date.today+5.months))
    create(:parcours, date_fin_clause_sociale: (Date.today+7.months))
    expect(Parcours.bientot_echus).to eq([parcours_bientot_echus])
  end

  it "bientot_echus classe les parcours bientot échus" do
    parcours_echus_en_dernier = create(:parcours, date_fin_clause_sociale: (Date.today+4.months))
    parcours_echus_en_1er = create(:parcours, date_fin_clause_sociale: (Date.today+3.months))
    expect(Parcours.bientot_echus).to eq([parcours_echus_en_1er, parcours_echus_en_dernier])
  end
end
