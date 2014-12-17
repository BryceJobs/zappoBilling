class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.references :product
      t.references :order
      t.integer :qty
      t.decimal :sub_total

      t.timestamps
    end

    add_index :order_lines,[:product_id, :order_id]
  end

end
