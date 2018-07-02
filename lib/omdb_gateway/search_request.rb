module OmdbGateway
  class SearchRequest < Request

    attr_reader :keyword, :page

    def initialize(params)
      @keyword = params[:keyword]
      @page = params[:page] || 1
      super
    end

    def fetch
      @response ||= RestClient.get(url)
      if @format.present? && @format.to_sym == :json
        JSON.parse(@response.body)
      elsif @format.present? && @format.to_sym == :xml
        @response.body
      else
        CollectionResponse.new(JSON.parse(@response.body))
      end
    end

    private

    def url
      raise InvalidIMDBParams.new('Query String not present') unless @keyword.present?
      url_string = super
      url_string += "&s=#{@keyword}&page=#{@page}"
      url_string
    end
  end
end
