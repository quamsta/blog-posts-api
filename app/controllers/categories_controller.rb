class CategoriesController < ApplicationController
	protect_from_forgery with: :null_session
	def index
		categories = Category.all
		respond_to do |format|
			format.json { render :json => categories.to_json(:include => :posts)}
		end
	end

	def create
		category = Category.new(category_params)

		if category.save
			#head 204, location: category
			render json: category, status: 201, location: category
		end
	end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end