require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
	test "successfully creates categories from api with correct token" do
		post '/categories',
		{ category:
			{ title: 'Test'}
		}.to_json,
		{'Authorization' => token_header(CORRECT_TOKEN), 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

		assert_equal 201, response.status
		assert_equal Mime::JSON, response.content_type

		category = json(response.body)
		assert_equal category_url(category[:id]), response.location

	end
	
	test "unsuccessfully creates categories from api with a fake token" do
		post '/categories',
		{ category:
			{ title: 'Test'}
		}.to_json,
		{'Authorization' => token_header(FAKE_TOKEN), 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

		assert_equal 401, response.status


	end
end