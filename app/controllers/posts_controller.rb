class PostsController < ApplicationController
	protect_from_forgery with: :null_session

	def index
		posts = Post.all

		respond_to do |format|
			format.json { render json: posts.to_json(:include => :categories), status: 200}
		end
	end

	def create
		post = Post.create(post_params)
		if post.save
			# On production, we might use an empty response for performance reasons.
			#head 204, location: post
			render json: post, status: 201, location: post
		else
			render json: post.errors, status: 422
		end
	end

	private

	def post_params
		params.require(:post).permit(:title, :body )
	end

end