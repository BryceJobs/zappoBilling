class AddShopIdToTables < ActiveRecord::Migration
  def change
  	remove_column :clients, "shop_id"
  	add_column :clients, "shop_id", :integer, :default => 1
  	add_column :products, "shop_id", :integer, :default => 1
  	add_column :orders, "shop_id", :integer, :default => 1
  end
end
