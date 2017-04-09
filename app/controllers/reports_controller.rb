require 'date'
class ReportsController < ApplicationController
  helper_method :sort_column_conditions, :sort_column_appointments

  def index
    if current_user.doctor.present?
      if params[:search_doctor_open_conditions]
        @doctor_open_conditions = PatientCondition.where(:doctor => current_user.doctor, :cured => nil).search(params[:search_doctor_open_conditions]).order(sort_column_conditions + ' ' + sort_direction)
      else
        @doctor_open_conditions = PatientCondition.where(:doctor => current_user.doctor, :cured => nil)
      end
      if params[:search_doctor_closed_conditions]
        @doctor_closed_conditions = PatientCondition.where(:doctor => current_user.doctor).where.not(:cured => nil).search(params[:search_doctor_closed_conditions]).order(sort_column_conditions + ' ' + sort_direction)
      else
        @doctor_closed_conditions = PatientCondition.where(:doctor => current_user.doctor).where.not(:cured => nil)
      end

      @doctor_appointments = Appointment.where(:doctor => current_user.doctor).where("date > ?", Date.today)
    end

    if params[:search_open_conditions]
      @open_conditions = PatientCondition.where(:cured => nil).search(params[:search_open_conditions]).order(sort_column_conditions + ' ' + sort_direction)
    else
      @open_conditions = PatientCondition.where(:cured => nil)
    end

    if params[:search_closed_conditions]
      @closed_conditions = PatientCondition.where.not(:cured => nil).search(params[:search_closed_conditions]).order(sort_column_conditions + ' ' + sort_direction)
    else
      @closed_conditions = PatientCondition.where.not(:cured => nil)
    end

    @appointments = Appointment.where("date > ?", Date.today)
  end

  private

  def sort_column_conditions
    params[:sort] || "code"
  end

  def sort_column_appointments
    params[:sort] || "date"
  end

  def sort_direction
    params[:direction] || "asc"
  end
end
