require 'test_helper'

class UpdatePostsTest < ActionDispatch::IntegrationTest
  setup { @post = Post.create!(title: 'Test Title', body: 'Test Body')}

  test 'succesfully updated from api' do
  	patch "/posts/#{@episode.id}",
  		{post: {title: 'Test Title Edit'}}.to_json,
  		{'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

  	updatedpost = @post.reload
  	
  	assert_equal 200, response.status
  	assert_equal 'Test Title Edit', updatedpost

  end
end
