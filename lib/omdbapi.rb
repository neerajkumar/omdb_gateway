require 'rest-client'
require 'json'
require 'yaml'
require 'active_support/core_ext/hash/indifferent_access'
require "omdbapi/version"
require 'omdbapi/movie'

module Omdbapi
  class InvalidIMDBID < Exception; end
  class InvalidConfiguration < Exception; end
end
