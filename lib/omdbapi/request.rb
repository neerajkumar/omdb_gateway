module Omdbapi
  class Request

    BASE_URI = 'https://www.omdbapi.com'.freeze

    attr_reader :id, :title, :year, :plot, :return_type, :api_version

    def initialize(params)
      @id = params[:id]
      @title = params[:title]
      @year = params[:year]
      @plot = params[:plot] || :short
      @format = params[:format]
      @api_version = params[:api_version] || 1
    end

    def fetch
      raise InvalidIMDBParams.new('IMDB ID/Title not present') if !@id.present? && !@title.present?

      url = "#{BASE_URI}/?apikey=#{api_key}"
      url += @id.present? ? "&i=#{@id}" : "&t=#{@title}"
      url += "&y=#{@year}" if @year.present?
      url += "&plot=#{@plot}" if @plot.present?
      url += "&v=#{@api_version}"
      url += "&r=#{@format}"
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

    def api_key
      raise InvalidConfiguration.new('omdb.yml file not present') unless File.exists?('config/initializers/omdb.yml')
      omdb_config = YAML::load(File.open('config/initializers/omdb.yml'))
      raise Unauthorized.new('Unauthorized - Provide a valid API key') unless omdb_config['apikey'].present?

      omdb_config['apikey']
    end
  end
end
