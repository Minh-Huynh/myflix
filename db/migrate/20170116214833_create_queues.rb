class CreateQueues < ActiveRecord::Migration
  def change
    create_table :queue_items do |t|
      t.integer :rank
      t.timestamps
    end
  end
end
