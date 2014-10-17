class Post < ActiveRecord::Base
	include ActiveModel::ForbiddenAttributesProtection
	
	has_many :categorizations
	has_many :categories, :through => :categorizations
end