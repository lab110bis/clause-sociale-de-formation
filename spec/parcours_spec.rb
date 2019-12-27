require "rails_helper"

describe Parcours, type: :model do
  it 'should have date_notification_marche' do
    expect(Parcours.new).to be_invalid
    expect(Parcours.new date_notification_marche: "25/12/2020").to be_valid
  end
end
