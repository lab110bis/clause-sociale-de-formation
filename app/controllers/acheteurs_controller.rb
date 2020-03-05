class AcheteursController < ApplicationController
  http_basic_authenticate_with name: ENV["BASIC_AUTH_LOGIN"], password: ENV["BASIC_AUTH_PASSWORD"], except: [:new, :create]

  def index
    puts "#"*66
    puts "#"*66
    @organismes_acheteurs = Parcours.select(:nom_organisme_acheteur).group(:nom_organisme_acheteur).count
  end

end
