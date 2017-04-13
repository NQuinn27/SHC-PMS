require 'date'
class ReportsController < ApplicationController
  helper_method :sort_column_conditions, :sort_column_appointments

  def index
    #use the presenter here to clean up code significantly
    @presenter = Reports::IndexPresenter.new(params, sort_direction, sort_column_conditions, current_user)
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
