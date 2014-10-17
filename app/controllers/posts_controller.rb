class PostsController < ApplicationController
	# Since we're API only, we aren't dealing with sessions.
	protect_from_forgery with: :null_session

	API_TOKEN = "supersuperserial"

	before_action :authenticate, only: [ :update, :destroy, :edit ]

	def index
		posts = Post.all
		respond_to do |format|
			format.json { render json: posts.to_json(:include => :categories), status: 200}
		end
	end

	#def render_failed_authentication
	#
	#end
	def create
		post = Post.create(post_params)
		if post.save
			# On a production ajax call, we might use an empty response for
			# performance reasons.
			#head 204, location: post
			render json: post, status: 201, location: post
		else
			render json: post.errors, status: 422
		end
	end

	def update
		post = Post.find(params[:id])
		if post.update(post_params)
			render json: post, status: 200
		else
			render json: post.errors, status: 422
		end
	end

	private

	def post_params
		params.require(:post).permit(:title, :body )
	end

	private

	def authenticate
		authenticate_or_request_with_http_token do |token, options|
			token == API_TOKEN
		end
	end

end