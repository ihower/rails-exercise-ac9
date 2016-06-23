class Topic < ActiveRecord::Base

  belongs_to :user

  has_many :likes
  has_many :liked_users, :through => :likes, :source => :user

  has_many :subscriptions
  has_many :subscribed_users, :through => :subscriptions, :source => :user

  has_many :category_ships
  has_many :categories, :through => :category_ships

  validates_presence_of :title

  def find_my_like(user)
    self.likes.where( :user => user ).first
  end

  def find_my_subscription(user)
    self.subscriptions.where( :user => user ).first
  end

end
