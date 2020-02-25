class ParcoursASuivreController < ApplicationController
  http_basic_authenticate_with name: ENV["BASIC_AUTH_LOGIN"], password: ENV["BASIC_AUTH_PASSWORD"], except: [:new, :create] unless Rails.env.test?

  # GET /parcours
  # GET /parcours.json
  def index
    @parcours_bientot_echus = Parcours.bientot_echus
    #@parcours = Parcours.where(domaine_activite_parcours: params[:domaine])
  end

end
