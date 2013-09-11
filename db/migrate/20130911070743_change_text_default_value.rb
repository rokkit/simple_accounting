class ChangeTextDefaultValue < ActiveRecord::Migration
  def change
    change_column :operations, :description, :text, :default => nil, :null => true
  end
end
