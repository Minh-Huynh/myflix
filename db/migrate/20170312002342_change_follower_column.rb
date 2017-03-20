class ChangeFollowerColumn < ActiveRecord::Migration
  def change
    rename_column :follows, :follower_id, :followee_id
  end
end
