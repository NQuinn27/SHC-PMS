class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all
    if params[:search]
      @patients = Patient.search(params[:search]).order(sort_column + ' ' + sort_direction)
    else
      @patients = Patient.order(sort_column + ' ' + sort_direction)
    end
    @glyphicon = sort_direction == "asc" ? "glyphicon-chevron-down" : "glyphicon-chevron-up"
    @sorting_by = sort_column
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    @patient.first_name = @patient.first_name.downcase
    @patient.lastt_name = @patient.last_name.downcase
    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :date_of_birth, :address, :phone_number, :notes, :allergies)
    end

    def sort_column
      params[:sort] || "last_name"
    end

    def sort_direction
      params[:direction] || "asc"
    end
end
