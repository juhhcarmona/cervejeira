require "vcr"

VCR.configure do |c|
  #The directory where your cassettes will be saved
  c.cassette_library_dir = 'spec/vcr'
  # HTTP request service.
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
  c.configure_rspec_metadata!
end