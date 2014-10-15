class Category < ActiveRecord::Base
   attr_accessible :title
   
   has_many :categorizations
   has_many :posts, through: :categorizations
end
