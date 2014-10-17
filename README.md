Rails Blog API
=======
The user can list, create and update blog posts and their related categories via this API. In this example, there are two versions of the API: **v1** and **v2**. 

**v1** can only get blog posts and categories, and cannot edit them.
**v2** can get, create, and update  blog posts and categories.

Get
----
No authentication required. Cached via the gem ActiveModel::Serializers version 0.8.0.

----------


Via application/html:

    http://localhost:3000/v1/posts.json
    http://localhost:3000/v2/posts.json
    
    http://localhost:3000/v1/categories.json
    http://localhost:3000/v2/categories.json

Via application/json:

    http://localhost:3000/v1/posts
    http://localhost:3000/v2/posts

Tests:

 - `tests/integration/list_posts_as_json.rb`
	 - returns posts as json
 - `tests/integration/list_categories_as_json.rb`
	 - returns categories as json

Example Output
		
		[
			{
				id: 1,
				title: "Hello, World.",
				body: "Hey.",
				categories: [
					{
						id: 1,
						created_at: "2014-10-15T04:33:10.753Z",
						updated_at: "2014-10-15T04:33:10.753Z",
						title: "Fun stuff"
					}
				]
			}
		]

Create
----
HTTP Authorization token required: **supersuperserial**

----------

POST Via application/json:

    http://localhost:3000/v2/posts
    http://localhost:3000/v2/categories
    


----------
Tests:

 - `tests/integration/create_posts_test.rb`
	 - successfully creates post from api using the correct token
	 - unsuccessfully attempts to create post from api using FAKE token
 - `tests/integration/create_categories_as_json_test.rb`
	 -  successfully creates category from api using the correct token
	 - unsuccessfully attempts to create category from api using FAKE token

Edit
----
HTTP Authorization token required: **supersuperserial**

----------

POST Via application/json:

    http://localhost:3000/v2/posts
    http://localhost:3000/v2/categories
Tests:

 - `tests/integration/update_posts_test.rb`
	 - successfully updates post from api using the correct token
	 - unsuccessfully attempts to update post from api using FAKE token
 - `tests/integration/update_categories_as_json_test.rb`
	 -  successfully updates category from api using the correct token
	 - unsuccessfully attempts to update category from api using FAKE token

Other Tests
-------

 - `tests/integration/versioned_routes_test.rb`


