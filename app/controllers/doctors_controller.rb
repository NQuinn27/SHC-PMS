class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:index]

  # GET /doctors
  # GET /doctors.json
  def index
    #return all of the doctors in the database
    @doctors = Doctor.all.paginate(:page => params[:page], :per_page => 30)
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
  end

  # GET /doctors/1/edit
  def edit
  end

  # POST /doctors
  # POST /doctors.json
  def create
    #Must create a Devise User for the doctor to sign in
    user = User.new(:email => params[:doctor][:user_email], :password => params[:doctor][:user_password], :password_confirmation => params[:doctor][:user_password_confirmation], :admin => false)
    user.save!
    @doctor = Doctor.new(doctor_params)
    @doctor.user = user
    respond_to do |format|
      if @doctor.save
        format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
        format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render :new }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor.user.destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def check_admin
      if !current_user.admin?
        flash[:error] = 'Access denied. User is not admin'
        redirect_to root_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:first_name, :last_name, :qualifications, :hospital, :user_id, :user_email, :user_password, :user_password_confirmation, :date_of_birth, :phone_office, :phone_mobile)
    end
end
