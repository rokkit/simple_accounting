class AddBankBookIdToOperations < ActiveRecord::Migration
  def change
    add_column :operations, :bank_book_id, :integer
  end
end
