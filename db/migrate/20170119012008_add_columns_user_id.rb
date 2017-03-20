class AddColumnsUserId < ActiveRecord::Migration
  def change
    add_column :queue_items, :user_id, :integer
    add_column :queue_items, :video_id, :integer
  end
end
