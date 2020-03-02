class RemoveMarqueFormVoituresController < ApplicationController
  before_action :set_remove_marque_form_voiture, only: [:show, :edit, :update, :destroy]

  # GET /remove_marque_form_voitures
  # GET /remove_marque_form_voitures.json
  def index
    @remove_marque_form_voitures = RemoveMarqueFormVoiture.all
  end

  # GET /remove_marque_form_voitures/1
  # GET /remove_marque_form_voitures/1.json
  def show
  end

  # GET /remove_marque_form_voitures/new
  def new
    @remove_marque_form_voiture = RemoveMarqueFormVoiture.new
  end

  # GET /remove_marque_form_voitures/1/edit
  def edit
  end

  # POST /remove_marque_form_voitures
  # POST /remove_marque_form_voitures.json
  def create
    @remove_marque_form_voiture = RemoveMarqueFormVoiture.new(remove_marque_form_voiture_params)

    respond_to do |format|
      if @remove_marque_form_voiture.save
        format.html { redirect_to @remove_marque_form_voiture, notice: 'Remove marque form voiture was successfully created.' }
        format.json { render :show, status: :created, location: @remove_marque_form_voiture }
      else
        format.html { render :new }
        format.json { render json: @remove_marque_form_voiture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /remove_marque_form_voitures/1
  # PATCH/PUT /remove_marque_form_voitures/1.json
  def update
    respond_to do |format|
      if @remove_marque_form_voiture.update(remove_marque_form_voiture_params)
        format.html { redirect_to @remove_marque_form_voiture, notice: 'Remove marque form voiture was successfully updated.' }
        format.json { render :show, status: :ok, location: @remove_marque_form_voiture }
      else
        format.html { render :edit }
        format.json { render json: @remove_marque_form_voiture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /remove_marque_form_voitures/1
  # DELETE /remove_marque_form_voitures/1.json
  def destroy
    @remove_marque_form_voiture.destroy
    respond_to do |format|
      format.html { redirect_to remove_marque_form_voitures_url, notice: 'Remove marque form voiture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remove_marque_form_voiture
      @remove_marque_form_voiture = RemoveMarqueFormVoiture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def remove_marque_form_voiture_params
      params.require(:remove_marque_form_voiture).permit(:marque)
    end
end
