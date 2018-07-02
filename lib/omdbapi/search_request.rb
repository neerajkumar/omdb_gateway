module Omdbapi
  class SearchRequest < Request

    attr_reader :query, :page

    def initialize(params)
      @query = params[:query]
      @page = params[:page] || 1
      super
    end

    def fetch
      @response ||= RestClient.get(url)
      byebug
    end

    def url
      raise InvalidIMDBParams.new('Query String not present') unless @query.present?
      url_string = super
      url_string += "&s=#{@query}&page=#{@page}"
      url_string
    end
  end
end
