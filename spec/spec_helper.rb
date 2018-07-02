require 'omdbapi'
require 'vcr'
require 'webmock'

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
  config.cassette_library_dir = 'spec/test_data/vcr_cassettes'
  config.hook_into :webmock
end
