require 'rest-client'
require 'json'
require 'yaml'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/object/blank'
require "omdbapi/version"
require 'omdbapi/movie'
require 'omdbapi/response'
require 'omdbapi/request'

module Omdbapi
  class InvalidIMDBID < Exception; end
  class InvalidConfiguration < Exception; end
  class Unauthorized < Exception; end
  class InvalidIMDBParams < Exception; end
end
