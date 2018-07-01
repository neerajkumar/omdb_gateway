module Omdbapi
  class Response

    BASE_URI = 'https://www.omdbapi.com'.freeze

    attr_reader :api_key, :id, :title, :year, :plot, :return_type, :api_version

    def initialize(id, title, year=nil, plot=:short, return_type=:json, api_version=1)
      @api_key = api_key
      @id = id
      @title = title
      @year = year
      @plot = plot || :short
      @return_type = return_type || :json
      @api_version = api_version || 1
    end

    def fetch
      raise InvalidIMDBParams.new('IMDB ID/Title not present') if !@id.present? && !@title.present?

      url = "#{BASE_URI}/?apikey=#{@api_key}"
      url += @id.present? ? "&i=#{@id}" : "&t=#{@title}"
      url += "&y=#{@year}" if @year.present?
      url += "&plot=#{@plot}" if @plot.present?
      url += "&v=#{@api_version}"
      url += "&r=#{@return_type}"
      @response ||= RestClient.get(url)
      if @return_type.to_sym == :json
        return JSON.parse(@response.body).with_indifferent_access
      else
        @response.body
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
