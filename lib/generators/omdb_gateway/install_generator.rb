require 'rails/generators'

class OmdbGateway::InstallGenerator < Rails::Generators::Base

  desc "copy omdb.yml file into config directory"

  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end

  def copy_config_file
    template 'config/initializers/omdb.yml', 'config/initializers/omdb.yml'
  end
end
