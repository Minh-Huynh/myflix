class QueueItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :video
  default_scope {order(rank: :asc)}
  validates_presence_of :user, :video
  delegate :category, to: :video

  def score
    user_review = video.reviews.where(user_id: user.id).first
    if user_review
      return user_review.score
    else
      return nil
    end
  end

  def video_title
    video.title 
  end

  def category_name
    category.title if video.category
  end

  def self.update_all_items(queue_items)
    QueueItem.transaction do
      queue_items.each do |id, data|
        queue_item = QueueItem.find(id)
        queue_item.update_rank_and_score(rank: data[:rank], score: data[:score])
      end
    end
  end

  def update_rank_and_score(rank:, score:)
    update_score(score: score) if score
    update_rank(rank: rank) if rank
  end

  def update_score(score:)
    video.reviews
          .find_or_create_by(user_id: user_id, video: video)
          .update!(score: score)
  end

  def update_rank(rank:)
    update!(rank: rank)
  end
end