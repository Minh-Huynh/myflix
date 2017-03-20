class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  has_many :queue_items
  has_many :follows
  has_many :followees, -> {uniq}, through: :follows
  has_many :reverse_follows, class_name: "Follow", foreign_key: "followee_id"
  has_many :followers, through: :reverse_follows, source: :user
  validates_presence_of :email, :password, :full_name
  validates_uniqueness_of :email
end