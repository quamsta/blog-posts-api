class Post < ActiveRecord::Base
	include ActiveModel::ForbiddenAttributesProtection
	#attr_accessible :title, :body

	has_many :categorizations
	has_many :categories, :through => :categorizations
end