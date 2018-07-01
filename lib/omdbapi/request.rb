module Omdbapi
  class Request

    attr_reader :id, :title, :year, :plot, :return_type

    def initialize(id: nil, title: nil, year: nil, plot: nil, return_type: nil)
      @id = id
      @title = title
      @year = year
      @plot = plot
      @return_type = return_type
    end
  end
end
