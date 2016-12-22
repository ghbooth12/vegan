$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'vegan'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock

  c.before_record do |i|
    i.response.headers.delete('Set-Cookie')
    #i.request.headers.delete('Authorization')
  end
end
