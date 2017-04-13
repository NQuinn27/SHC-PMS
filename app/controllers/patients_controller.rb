require 'date'
class PatientsController < ApplicationController

  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction, :sort_column_conditions
  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all
    if params[:search]
      @patients = Patient.search(params[:search]).order(sort_column + ' ' + sort_direction)
      @patients = @patients.paginate(:page => params[:page], :per_page => 30).order(sort_column + ' ' + sort_direction)
    else
      @patients = Patient.all.paginate(:page => params[:page], :per_page => 30).order(sort_column + ' ' + sort_direction)
    end
    @presenter = Patients::IndexPresenter.new(sort_direction, sort_column)
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient_condition = PatientCondition.new
    @patient_condition.patient = @patient
    if current_user.doctor.present?
      @patient_condition.doctor = current_user.doctor
    end
    @patient_condition.reported = Date.today

    @presenter = Patients::ShowPresenter.new(@patient)
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

    #The sorting column. Default to last_name
    def sort_column
      params[:sort] || "last_name"
    end

    #The sort direction. Default to ascending
    def sort_direction
      params[:direction] || "asc"
    end

    def sort_column_conditions
      params[:sort] || "code"
    end

    def sort_direction
      params[:direction] || "asc"
    end
end
