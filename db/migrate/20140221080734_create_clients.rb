class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :Fname
      t.string :Lname
      t.string :address, :limit => 60
      t.string :phonenumber

      t.timestamps
    end
  end
end
