class AddColumnFromToInvitation < ActiveRecord::Migration
  def change
    add_column :invitations, :from, :string
  end
end
