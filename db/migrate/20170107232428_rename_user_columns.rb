class RenameUserColumns < ActiveRecord::Migration
  def change
    rename_column :users, :username, :full_name
    rename_column :users, :password, :email
  end
end
