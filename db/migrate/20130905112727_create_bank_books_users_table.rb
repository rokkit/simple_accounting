class CreateBankBooksUsersTable < ActiveRecord::Migration
  def change
    create_table :bank_books_users do |t|
      t.integer :bank_book_id, null: false
      t.integer :user_id, null: false
    end
    add_index(:bank_books_users, [:bank_book_id, :user_id], :unique => true)
  end
end
