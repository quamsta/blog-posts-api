require 'test_helper'

class UpdateCategoriesTest < ActionDispatch::IntegrationTest
  setup { @category = Category.create!(title: 'Test Title')}

  test 'succesfully updated category from api with the correct token' do
  	patch "/v2/categories/#{@category.id}",
  		{category: {title: 'Test Title Edit'}}.to_json,
  		{'Authorization' => token_header(CORRECT_TOKEN), 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

  	reloaded_category = @category.reload

  	assert_equal 200, response.status
  	assert_equal 'Test Title Edit', reloaded_category.title

  end
   test 'unsuccesfully updated category from api with a fake token' do
  	patch "/v2/categories/#{@category.id}",
  		{category: {title: 'Test Title Edit'}}.to_json,
  		{'Authorization' => token_header(FAKE_TOKEN), 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

  	reloaded_category = @category.reload

  	assert_equal 401, response.status

  end
end
