class CreateFollowsTable < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.timestamps
      t.belongs_to :user
      t.belongs_to :follower
    end
  end
end
