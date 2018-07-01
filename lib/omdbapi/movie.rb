module Omdbapi
  class Movie

    BASE_URI = 'https://www.omdbapi.com'.freeze

    def self.find_by_id(imdb_id)
      raise InvalidIMDBID.new('IMDB ID not present') if imdb_id.empty? || imdb_id.nil?

      raise InvalidConfiguration.new('omdb.yml file not present') unless File.exists?('config/initializers/omdb.yml')
      omdb_config = YAML::load(File.open('config/initializers/omdb.yml'))

      raise Unauthorized.new('Unauthorized - Provide a valid API key') unless omdb_config['apikey'].present?

      @response ||= RestClient.get("#{BASE_URI}/?apikey=#{omdb_config['apikey']}&i=#{imdb_id}")
      JSON.parse(@response.body).with_indifferent_access
    end
  end
end
