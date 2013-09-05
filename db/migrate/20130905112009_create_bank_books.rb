class CreateBankBooks < ActiveRecord::Migration
  def change
    create_table :bank_books, id: false do |t|
      t.integer :id, :options => 'PRIMARY KEY', null: false
      t.string :name, default: "", null: false
      t.text :bank_account
      t.decimal :amount, :precision => 20, :scale => 10, default: 0
      t.decimal :saldo, :precision => 20, :scale => 10, default: 0

      t.timestamps
    end
  end
end
