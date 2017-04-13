require 'date'
module Reports
  class IndexPresenter
    def initialize(params, sort_direction, sort_column, current_user)
      @params = params
      @sort_column = sort_column
      @sort_direction = sort_direction
      @current_user = current_user
    end

    def doctor_open_conditions
      if @params[:search_doctor_open_conditions]
        PatientCondition.where(:doctor => @current_user.doctor, :cured => nil).search(@params[:search_doctor_open_conditions]).order(@sort_column + ' ' + @sort_direction)
      else
        PatientCondition.where(:doctor => @current_user.doctor, :cured => nil)
      end
    end

    def doctor_closed_conditions
      if @params[:search_doctor_closed_conditions]
        PatientCondition.where(:doctor => @current_user.doctor).where.not(:cured => nil).search(@params[:search_doctor_closed_conditions]).order(@sort_column + ' ' + @sort_direction)
      else
        PatientCondition.where(:doctor => @current_user.doctor).where.not(:cured => nil)
      end
    end

    def doctor_appointments
      Appointment.where(:doctor => @current_user.doctor).where("date > ?", Date.today)
    end

    def open_conditions
      if @params[:search_open_conditions]
        PatientCondition.where(:cured => nil).search(params[:search_open_conditions]).order(@sort_column + ' ' + @sort_direction)
      else
        PatientCondition.where(:cured => nil)
      end
    end

    def closed_conditions
      if @params[:search_closed_conditions]
        PatientCondition.where.not(:cured => nil).search(@params[:search_closed_conditions]).order(@sort_column + ' ' + @sort_direction)
      else
        PatientCondition.where.not(:cured => nil)
      end
    end

    def appointments
      @appointments = Appointment.where("date > ?", Date.yesterday)
    end
  end
end
