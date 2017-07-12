require 'rack'
require 'rack/contrib'
require 'rack/contrib/try_static'

use Rack::Deflater

use Rack::TryStatic,
  :root => "_site",
  :urls => %w[/],
  :try => ['.html', 'index.html', '/index.html']

run lambda { |env|
  [
    404,
    {
      'Content-Type' => 'text/html',
      'Cache-Policy' => 'public, max-age=86400'
    },
    File.open('_site/404.html', File::RDONLY)
  ]
}
