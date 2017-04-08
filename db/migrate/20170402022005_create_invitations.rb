class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.timestamps
      t.string :email
      t.string :invite_token
    end
  end
end
