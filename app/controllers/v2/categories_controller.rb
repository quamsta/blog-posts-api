module V2
	class CategoriesController < ApplicationController
		# Since we're API only, we aren't dealing with sessions.
		protect_from_forgery with: :null_session
		def index
			categories = Category.all
			respond_to do |format|
				format.json { render json: categories.to_json(:include => :posts)}
			end
		end

		def create
			category = Category.new(category_params)

			if category.save
				# On a production ajax call, we might use an empty response for
				# performance reasons.
				#head 204, location: category
				render json: category, status: 201, location: category
			end
		end

		def update
			category = Category.find(params[:id])
			if category.update(category_params)
				render json: category, status: 200
			else
				render json: category.errors, status: 422
			end
		end

		private

		def category_params
			params.require(:category).permit(:title)
		end

	end
end