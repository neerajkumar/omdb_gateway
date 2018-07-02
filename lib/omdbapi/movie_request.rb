module Omdbapi
  class MovieRequest < Request

    attr_reader :id, :title

    def initialize(params)
      @id = params[:id]
      @title = params[:title]
      super
    end

    def fetch
      @response ||= RestClient.get(url)
      if @format.present? && @format.to_sym == :json
        return JSON.parse(@response.body).with_indifferent_access
      elsif @format.present? && @format.to_sym == :xml
        @response.body
      else
        response_hash = JSON.parse(@response.body)
        Response.new(response_hash)
      end
    end

    private
    
    def url
      raise InvalidIMDBParams.new('IMDB ID/Title not present') if !@id.present? && !@title.present?
      url_string = super
      url_string += @id.present? ? "&i=#{@id}" : "&t=#{@title}"

      url_string
    end
  end
end
