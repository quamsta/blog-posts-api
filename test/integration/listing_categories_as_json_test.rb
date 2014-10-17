require 'test_helper'

class ListingCategoriesAsJsonTest < ActionDispatch::IntegrationTest
	test 'returns categories as json' do
		get 'categories', {}, {'Accept' => Mime::JSON}
		assert_equal 200, response.status
		assert_equal Mime::JSON, response.content_type
	end
end
