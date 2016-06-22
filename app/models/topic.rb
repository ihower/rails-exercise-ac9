class Topic < ActiveRecord::Base

  belongs_to :user

  has_many :likes
  has_many :liked_users, :through => :likes, :source => :user

  validates_presence_of :title

end
