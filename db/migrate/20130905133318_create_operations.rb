class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.datetime :o_date, default: DateTime.now
      t.integer :from_id
      t.decimal :amount, :precision => 20, :scale => 10
      t.text :description
      t.references :user, index: true
      t.references :money_type_operation
      t.references :io_type_operation

      t.timestamps
    end
  end
end
