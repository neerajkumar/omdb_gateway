require 'rest-client'
require 'json'
require 'yaml'
require 'active_support'
require 'active_support/core_ext'
require "omdb_gateway/version"
require 'omdb_gateway/movie'
require 'omdb_gateway/search'
require 'omdb_gateway/response'
require 'omdb_gateway/collection_response'
require 'omdb_gateway/request'
require 'omdb_gateway/search_request'
require 'omdb_gateway/movie_request'

module OmdbGateway
  class InvalidIMDBID < Exception; end
  class InvalidConfiguration < Exception; end
  class Unauthorized < Exception; end
  class InvalidIMDBParams < Exception; end
end
