ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

CORRECT_TOKEN = "supersuperserial"
FAKE_TOKEN = "fake"

class ActiveSupport::TestCase
	# Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
	#
	# Note: You'll currently still have to declare fixtures explicitly in integration tests
	# -- they do not yet inherit this setting
	fixtures :all

	def token_header(token)
		ActionController::HttpAuthentication::Token.encode_credentials(token)
	end

	def json(content)
		JSON.parse(content, symbolize_names: true)
	end
	# Add more helper methods to be used by all tests here...
end
