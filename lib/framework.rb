require 'erb'
require 'webrick'

$LOAD_PATH << File.expand_path('..', __FILE__)

module Framework
  autoload :AbstractServer, 'framework/servers/abstract_server'
  autoload :WEBrickServer, 'framework/servers/webrick_server'
  autoload :VERSION, 'framework/version'
end
