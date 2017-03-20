class Review < ActiveRecord::Base
  belongs_to :video
  belongs_to :user
  validates_presence_of :score
  default_scope { order(created_at: :asc)}

end