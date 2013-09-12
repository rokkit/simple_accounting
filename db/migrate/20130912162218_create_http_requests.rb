class CreateHttpRequests < ActiveRecord::Migration
  def change
    create_table :http_requests do |t|
      t.string :method
      t.string :parameters
      t.string :ip_address

      t.timestamps
    end
  end
end
