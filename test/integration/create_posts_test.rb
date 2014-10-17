require 'test_helper'

class CreatePostsTest < ActionDispatch::IntegrationTest

	test "successfully creates post from api using the correct token" do
		post '/v2/posts',
		{ post:
			{ title: 'Test', body: 'TestPost' }
		}.to_json,
		{ 'Authorization' => token_header(CORRECT_TOKEN), 
			'Accept' => Mime::JSON,
			 'Content-Type' => Mime::JSON.to_s }
		assert_equal 201, response.status
		assert_equal Mime::JSON, response.content_type

		post = json(response.body)
		assert_equal post_url(post[:id]), response.location
	end

	test "unsuccessfully attempts to create post from api using FAKE token" do
		post '/v2/posts',
		{ post:
			{ title: 'Test', body: 'TestPost' }
		}.to_json,
		{ 'Authorization' => token_header(FAKE_TOKEN), 
			'Accept' => Mime::JSON,
			 'Content-Type' => Mime::JSON.to_s }

		assert_equal 401, response.status
	end
end