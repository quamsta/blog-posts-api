require 'test_helper'

class VersionedRoutesTest < ActionDispatch::IntegrationTest
  test 'routes version' do

  	assert_generates '/v1/posts', { controller: 'v1/posts', action: 'index' }
  	assert_generates '/v2/posts', { controller: 'v2/posts', action: 'index' }

  	assert_generates '/v1/categories', { controller: 'v1/categories', action: 'index' }
  	assert_generates '/v2/categories', { controller: 'v2/categories', action: 'index' }
  end
end
