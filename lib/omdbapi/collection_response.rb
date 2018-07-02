module Omdbapi
  class CollectionResponse

    attr_reader :result, :total_results, :response

    def initialize(response_hash)
      @result = []
      response_hash['Search'].collect { |hash| @result << Response.new(hash) } if response_hash['Search'].present?
      @total_results = response_hash['totalResults']
      @response = response_hash['Response']
    end
  end
end
