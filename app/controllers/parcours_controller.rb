class ParcoursController < ApplicationController
  http_basic_authenticate_with name: ENV["BASIC_AUTH_LOGIN"], password: ENV["BASIC_AUTH_PASSWORD"], except: [:new, :create] unless Rails.env.test?
  before_action :set_parcours, only: [:show, :edit, :update, :destroy]

  # GET /parcours
  # GET /parcours.json
  def index
    if params[:acheteur]
      @parcours = Parcours.par_acheteur(params[:acheteur])
    else
      @parcours = Parcours.where(domaine_activite_parcours: params[:domaine])
    end
    @titre_parcours = params[:domaine]
  end

  # GET /parcours/1
  # GET /parcours/1.json
  def show
  end

  # GET /parcours/new
  def new
    @parcours = Parcours.new
  end

  # GET /parcours/1/edit
  def edit
  end

  def create
    @parcours = Parcours.new(parcours_params)
    if @parcours.save
      redirect_to root_path, notice: 'Parcours was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /parcours/1
  # PATCH/PUT /parcours/1.json
  def update
    respond_to do |format|
      if @parcours.update(parcours_params)
        format.html { redirect_to @parcours, notice: 'Parcours was successfully updated.' }
        format.json { render :show, status: :ok, location: @parcours }
      else
        format.html { render :edit }
        format.json { render json: @parcours.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parcours/1
  # DELETE /parcours/1.json
  def destroy
    @parcours.destroy
    respond_to do |format|
      format.html { redirect_to parcours_index_url, notice: 'Parcours was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_parcours
    @parcours = Parcours.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def parcours_params
    params.require(:parcours).permit(:nom_organisme_acheteur, :type_acheteur, :adresse_acheteur, :nom_prenom_contact_acheteur, :mail_contact_acheteur, :telephone_contact_acheteur, :objet_marche, :date_notification_marche, :date_fin_clause_sociale, :date_fin_clause_sociale_reconduction_comprise, :nom_entreprise, :secteur_activite_entreprise, :site_web_entreprise, :nom_prenom_referent_entreprise, :telephone_referent_entreprise, :fonction_referent_entreprise, :nom_prenom_2eme_referent_entreprise, :telephone_2eme_referent_entreprise, :fonction_2eme_referent_entreprise, :heures_parcours, :adresse_parcours, :region_parcours, :departement_parcours, :academie_parcours, :domaine_activite_parcours, :details_taches_proposees_parcours, :autre_remarque)
  end
end
