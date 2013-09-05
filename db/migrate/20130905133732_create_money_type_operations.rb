class CreateMoneyTypeOperations < ActiveRecord::Migration
  def change
    create_table :money_type_operations do |t|
      t.string :name

      t.timestamps
    end
  end
end
