class Video < ActiveRecord::Base
  belongs_to :category
  has_many :reviews
  has_many :queue_items
  validates_presence_of :title, :description
  mount_uploader :cover, CoverUploader

  def self.search_by_title(search_term)
    #return array of videos, or empty
    #write test first
    #write test cases: none, one, many videos
    return [] if search_term.blank?
    Video.where(["lower(title) LIKE ?", "%#{search_term}%"])
  end

  def average_review_score
    reviews.average(:score)
  end
end
