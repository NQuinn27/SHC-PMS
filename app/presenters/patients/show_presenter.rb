require 'date'
module Patients
  class ShowPresenter

    def initialize(patient)
      @patient = patient
    end

    def current_conditions
      PatientCondition.where(:patient => @patient, :cured => nil)
    end

    def past_conditions
      PatientCondition.where(:patient => @patient).where.not(:cured => nil)
    end

    def future_appointments
      Appointment.where(:patient => @patient).where("date > ?", Date.yesterday)
    end
  end
end
