require 'test_helper'

class CreatePostsTest < ActionDispatch::IntegrationTest
	test "creates posts from api" do
		post '/posts',
		{ post:
			{ title: 'Test', body: 'TestPost' }
		}.to_json,
		{ 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

		assert_equal 201, response.status
		assert_equal Mime::JSON, response.content_type

		post = json(response.body)
		assert_equal post_url(post[:id]), response.location

	end
end