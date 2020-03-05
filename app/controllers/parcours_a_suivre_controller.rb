class ParcoursASuivreController < ApplicationController
  http_basic_authenticate_with name: ENV["BASIC_AUTH_LOGIN"], password: ENV["BASIC_AUTH_PASSWORD"], except: [:new, :create] unless Rails.env.test?

  # GET /parcours
  # GET /parcours.json
  def index
    if params[:academie].nil?
      @nombre_parcours = Parcours.groupe_bientot_echus_par_academies.count
      render :academies
    else
      @parcours_bientot_echus = Parcours.bientot_echus.par_academie params[:academie]
    end
  end

end
