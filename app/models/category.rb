class Category < ActiveRecord::Base
	include ActiveModel::ForbiddenAttributesProtection
	
	has_many :categorizations
	has_many :posts, :through => :categorizations
end
