class Category < ActiveRecord::Base
	include ActiveModel::ForbiddenAttributesProtection
	attr_accessible :title

	has_many :categorizations
	has_many :posts, :through => :categorizations
end
