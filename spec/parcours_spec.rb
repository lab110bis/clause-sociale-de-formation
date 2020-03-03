require "rails_helper"

describe Parcours, type: :model do
  it 'a une fabrique valide' do
    expect(build(:parcours)).to be_valid
  end

  it 'doit avoir une date_notification_marche' do
    expect(build(:parcours, date_notification_marche: nil)).to be_invalid
  end

  it 'doit avoir un objet_detaille_marche' do
    expect(build(:parcours, objet_detaille_marche: nil)).to be_invalid
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

  it "bientot_echus prends en compte le renouvellement du marché" do
    parcours_bientot_echus = create(
      :parcours,
      date_fin_clause_sociale: (Date.today+5.months),
      date_fin_clause_sociale_reconduction_comprise: (Date.today+1.year)
    )
    expect(Parcours.bientot_echus).to eq([])
  end
end
