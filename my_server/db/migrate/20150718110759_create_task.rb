class CreateTask < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :taskable_type
      t.integer :taskable_id
      t.integer :status
      t.integer :user_id
      t.integer :gv_id
      t.string :timestamp
      t.timestamps
    end
  end
end
