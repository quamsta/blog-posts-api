require 'test_helper'

class UpdateCategoriesTest < ActionDispatch::IntegrationTest
  setup { @category = Category.create!(title: 'Test Title')}

  test 'succesfully updated category from api' do
  	patch "/categories/#{@category.id}",
  		{category: {title: 'Test Title Edit'}}.to_json,
  		{'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

  	reloaded_category = @category.reload

  	assert_equal 200, response.status
  	assert_equal 'Test Title Edit', reloaded_category.title

  end
end
