require 'zeitwerk'
require 'vcr'
require 'dotenv/load'

loader = Zeitwerk::Loader.new
loader.push_dir("#{__dir__}/../lib/")
loader.setup

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end


VCR.configure do |config|
  config.cassette_library_dir = 'spec/test_requests'
  config.hook_into :webmock
  config.ignore_request { |request| request.uri == 'https://www.googleapis.com/oauth2/v4/token' }
end
