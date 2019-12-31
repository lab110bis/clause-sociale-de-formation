class DomainesController < ApplicationController
  http_basic_authenticate_with name: ENV["BASIC_AUTH_LOGIN"], password: ENV["BASIC_AUTH_PASSWORD"], except: [:new, :create]

  def index
    @domaines = Parcours.all.map(&:domaine_activite_parcours).uniq
  end

end
