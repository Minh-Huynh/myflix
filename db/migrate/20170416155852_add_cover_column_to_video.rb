class AddCoverColumnToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :cover, :string
  end
end
