module Omdbapi
  class Search

    def initialize(*args)
      params = args[1]
      params.merge!(query: args[0])
      Request.new(params).fetch
    end
  end
end
