class Topic < ActiveRecord::Base

  belongs_to :user

  has_many :likes
  has_many :liked_users, :through => :likes, :source => :user

  has_many :subscriptions
  has_many :subscribed_users, :through => :subscriptions, :source => :user

  validates_presence_of :title

  def find_my_like(user)
    self.likes.where( :user => user ).first
  end

end
