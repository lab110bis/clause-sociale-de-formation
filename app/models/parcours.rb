class Parcours < ApplicationRecord
  belongs_to :referent_mlds, optional: true
  validates :date_notification_marche, presence: true
end
