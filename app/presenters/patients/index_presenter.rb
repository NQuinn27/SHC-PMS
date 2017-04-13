module Patients
  class IndexPresenter
    def initialize(sort_direction, sort_column)
      @sort_direction = sort_direction
      @sort_column = sort_column
    end

    def glyphicon
      @sort_direction == "asc" ? "glyphicon-chevron-down" : "glyphicon-chevron-up"
    end

    def sorting_by
      @sort_column
    end
  end
end
