require 'rest-client'
require 'json'
require 'yaml'
require 'active_support'
require 'active_support/core_ext'
require "omdbapi/version"
require 'omdbapi/movie'
require 'omdbapi/search'
require 'omdbapi/response'
require 'omdbapi/collection_response'
require 'omdbapi/request'
require 'omdbapi/search_request'
require 'omdbapi/movie_request'

module Omdbapi
  class InvalidIMDBID < Exception; end
  class InvalidConfiguration < Exception; end
  class Unauthorized < Exception; end
  class InvalidIMDBParams < Exception; end
end
