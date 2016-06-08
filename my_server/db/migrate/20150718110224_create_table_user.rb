class CreateTableUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :contact
      t.string :gender
      t.integer :age
      t.string :city
      t.string :state
      t.timestamps
    end
  end
end
