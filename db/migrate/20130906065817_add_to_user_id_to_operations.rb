class AddToUserIdToOperations < ActiveRecord::Migration
  def change
    add_column :operations, :to_user_id, :integer
  end
end
