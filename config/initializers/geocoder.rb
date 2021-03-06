# config/initializers/geocoder.rb
Geocoder.configure(

  # geocoding service (see below for supported options):
  # :lookup => :yandex,

  # IP address geocoding service (see below for supported options):
  :maxmind => {:service => :omni},

  # to use an API key:
  # :api_key => "...",

  # geocoding service request timeout, in seconds (default 3):
  :timeout => 15000

  # set default units to kilometers:
  # :units => :km,

  # caching (see below for details):
  # :cache => Redis.new,
  # :cache_prefix => "..."

)
