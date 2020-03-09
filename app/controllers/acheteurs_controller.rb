class AcheteursController < ApplicationController
  http_basic_authenticate_with name: ENV["BASIC_AUTH_LOGIN"], password: ENV["BASIC_AUTH_PASSWORD"], except: [:new, :create]

  def index
    @organismes_acheteurs = Parcours.nombre_par_acheteur
  end

end
