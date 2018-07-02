module Omdbapi
  class Request

    BASE_URI = 'https://www.omdbapi.com'.freeze

    attr_reader :year, :plot, :return_type, :api_version

    def initialize(params)
      @year = params[:year]
      @plot = params[:plot] || :short
      @format = params[:format]
      @api_version = params[:api_version] || 1
    end

    protected

    def url
      url_string = "#{BASE_URI}/?apikey=#{api_key}"
      url_string += "&y=#{@year}" if @year.present?
      url_string += "&plot=#{@plot}" if @plot.present?
      url_string += "&r=#{@format}" if @format.present?
      url_string += "&v=#{@api_version}"
      url_string
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
