require 'date'
class PatientConditionsController < ApplicationController
  before_action :set_patient_condition, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  # GET /patient_conditions
  # GET /patient_conditions.json
  def index
    @patient_conditions = PatientCondition.all
  end

  # GET /patient_conditions/1
  # GET /patient_conditions/1.json
  def show
  end

  # GET /patient_conditions/new
  def new
    @patient_condition = PatientCondition.new

    if params[:patient_id]
      @patient_condition.patient_id = params[:patient_id]
    end

    if params[:doctor_id]
      @patient_condition.doctor_id = params[:doctor_id]
    end
    @glyphicon = sort_direction == "asc" ? "glyphicon-chevron-down" : "glyphicon-chevron-up"
    @sorting_by = sort_column
  end

  # GET /patient_conditions/1/edit
  def edit
  end

  # POST /patient_conditions
  # POST /patient_conditions.json
  def create
    if !params[:patient_condition][:reported]
      params[:patient_condition][:reported] = Date.today
    end
    if !params[:patient_condition][:doctor]
      if current_user.doctor.present?
        params[:patient_condition][:doctor_id] = current_user.doctor.id
      end
    end

    @patient_condition = PatientCondition.new(patient_condition_params)
    respond_to do |format|
      if @patient_condition.save
        format.html { redirect_to patient_path(@patient_condition.patient), notice: 'Patient condition was successfully created.' }
        format.json { render :show, status: :created, location: @patient_condition }
      else
        format.html { render :new }
        format.json { render json: @patient_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patient_conditions/1
  # PATCH/PUT /patient_conditions/1.json
  def update
    respond_to do |format|
      if @patient_condition.update(patient_condition_params)
        format.html { redirect_to @patient_condition, notice: 'Patient condition was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient_condition }
      else
        format.html { render :edit }
        format.json { render json: @patient_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_conditions/1
  # DELETE /patient_conditions/1.json
  def destroy
    @patient_condition.destroy
    respond_to do |format|
      format.html { redirect_to patient_conditions_url, notice: 'Patient condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def cure
    @patient_condition = PatientCondition.find(params[:id])
    @patient_condition.cured = Date.today
    if @patient_condition.save
      redirect_to patient_path(@patient_condition.patient), notice: 'Patient condition was successfully marked as cured.'
    else
      redirect_to patient_path(@patient_condition.patient), error: 'Error when marking as cured.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_condition
      @patient_condition = PatientCondition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_condition_params
      params.require(:patient_condition).permit(:patient_id, :doctor_id, :reported, :cured, :notes, :icd10_id)
    end

    def sort_column
      params[:sort] || "code"
    end

    def sort_direction
      params[:direction] || "asc"
    end
end
