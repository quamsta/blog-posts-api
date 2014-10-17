require 'test_helper'

class UpdatePostsTest < ActionDispatch::IntegrationTest
  setup { @post = Post.create!(title: 'Test Title', body: 'Test Body')}

  test 'succesfully updated post from api' do
  	patch "/posts/#{@post.id}",
  		{post: {title: 'Test Title Edit'}}.to_json,
  		{'Authorization' => token_header(@correct_token),
  			'Accept' => Mime::JSON, 
  			'Content-Type' => Mime::JSON.to_s}

  	reloaded_post = @post.reload

  	assert_equal 200, response.status
  	assert_equal 'Test Title Edit', reloaded_post.title

  end
end
