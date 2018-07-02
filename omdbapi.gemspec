
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omdb_gateway/version"

Gem::Specification.new do |spec|
  spec.name          = "omdb_gateway"
  spec.version       = OmdbGateway::VERSION
  spec.authors       = ["Neeraj Kumar"]
  spec.email         = ["neeraj.kumar@gmail.com"]

  spec.summary       = %q{A rubygem to fetch movie information from IMDB based on API Key.}
  spec.description   = %q{omdb_gateway is a rubygem to fetch the movie information, all content and images on the IMDB site based on API Key which are contributed and maintained by IMDB users.}
  spec.homepage      = 'https://github.com/neerajkumar/omdb_gateway'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
