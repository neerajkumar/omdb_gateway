require 'rest-client'
require 'json'
require 'yaml'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/object/blank'
require "omdbapi/version"
require 'omdbapi/movie'

module Omdbapi
  class InvalidIMDBID < Exception; end
  class InvalidConfiguration < Exception; end
  class Unauthorized < Exception; end
end
