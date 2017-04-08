class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  has_many :queue_items
  has_many :follows
  has_many :followees, -> {uniq}, through: :follows
  has_many :reverse_follows, class_name: "Follow", foreign_key: "followee_id"
  has_many :followers, through: :reverse_follows, source: :user
  validates_presence_of :email, :full_name
  validates_presence_of :password, on: :create
  validates_uniqueness_of :email
  before_create :generate_reset_token

  def generate_reset_token
    self.reset_token = SecureRandom.urlsafe_base64
  end
end