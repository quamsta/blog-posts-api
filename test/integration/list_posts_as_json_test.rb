require 'test_helper'

class ListPostsAsJsonTest < ActionDispatch::IntegrationTest
	test 'returns posts as json' do
		get '/v2/posts', :format => :json
		assert_equal 200, response.status
		assert_equal Mime::JSON, response.content_type
	end
end