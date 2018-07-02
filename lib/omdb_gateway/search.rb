module OmdbGateway
  class Search

    def self.query(*args)
      params = args[1] || {}
      params.merge!(keyword: args[0])
      SearchRequest.new(params).fetch
    end
  end
end
