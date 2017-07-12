require 'rack'
require 'rack/contrib'
require 'rack/contrib/try_static'

use Rack::Deflater

use Rack::TryStatic,
  :root => "_site",
  :urls => %w[/],
  :try => ['.html', 'index.html', '/index.html']

run Rack::NotFound.new('_site/404.html')
