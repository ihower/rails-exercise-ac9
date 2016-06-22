class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :topics

  has_many :likes
  has_many :like_topics, :through => :likes, :source => :topic

  has_many :subscriptions
  has_many :subscribe_topics, :through => :subscriptions, :source => :topic

end
