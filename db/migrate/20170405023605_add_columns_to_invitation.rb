class AddColumnsToInvitation < ActiveRecord::Migration
  def change
    add_column :invitations, :name, :string
    add_column :invitations, :message, :string
  end
end
