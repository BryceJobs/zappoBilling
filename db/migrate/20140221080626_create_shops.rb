class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.text :description
      t.string :address, :limit => 60
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
