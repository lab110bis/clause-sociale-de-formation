class Parcours < ApplicationRecord
  belongs_to :referent_mlds, optional: true
end
