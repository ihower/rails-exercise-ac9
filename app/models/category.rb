class Category < ActiveRecord::Base

  has_many :category_ships
  has_many :topics, :through => :category_ships
  
end
