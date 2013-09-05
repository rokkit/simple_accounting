class CreateIoTypeOperations < ActiveRecord::Migration
  def change
    create_table :io_type_operations do |t|
      t.string :name

      t.timestamps
    end
  end
end
