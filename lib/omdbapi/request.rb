module Omdbapi
  class Request

    attr_reader :id, :title, :year, :plot, :return_type, :api_version

    def initialize(id: nil, title: nil, year: nil, plot: nil, return_type: nil, api_version: 1)
      @id = id
      @title = title
      @year = year
      @plot = plot
      @return_type = return_type
      @api_version = api_version
    end
  end
end
