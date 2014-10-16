require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
	test "creates categories from api" do
		post '/categories',
		{ category:
			{ title: 'Test'}
		},
		{ 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

		assert_equal 201, response.status
		assert_equal Mime::JSON, response.content_type

		category = json(response.body)
		assert_equal category_url(category[:id]), response.location

	end
end