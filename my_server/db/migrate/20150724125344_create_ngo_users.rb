class CreateNgoUsers < ActiveRecord::Migration
  def change
    create_table :ngo_users do |t|
      t.string :ngoname
      t.string :username
      t.string :password 
      t.string :salt 
      t.integer :age
      t.integer :phone
      t.string :city
      t.string :website
      t.string :email
      t.string :field

      t.timestamps null: false
    end
  end
end
