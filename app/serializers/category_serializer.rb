class CategorySerializer < ApplicationSerializer
	attributes :id, :title
	has_many :posts
end
