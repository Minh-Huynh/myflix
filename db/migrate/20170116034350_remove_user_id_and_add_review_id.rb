class RemoveUserIdAndAddReviewId < ActiveRecord::Migration
  def change
    remove_column :videos, :user_id
    add_column :reviews, :user_id, :integer
  end
end
