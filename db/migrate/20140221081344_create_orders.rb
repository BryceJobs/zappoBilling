class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :num_item
      t.decimal :amount
      t.integer :client_id

      t.timestamps
    end
  end
end
