class PostSerializer < ApplicationSerializer
	attributes :id, :title, :body
	has_many :categories
end
