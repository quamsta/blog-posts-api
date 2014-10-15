class Post < ActiveRecord::Base
   attr_accessible :title, :body

   has_many :categorizations
   has_many :categories, :through => :categorizations
   
end