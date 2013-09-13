class AddPasswordsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fake_password, :string
    add_column :users, :alert_password, :string
  end
end
