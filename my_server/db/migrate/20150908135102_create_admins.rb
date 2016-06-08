class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.integer :pin
      t.string :gcmid
      t.boolean :logged_in

      t.timestamps null: false
    end
  end
end
