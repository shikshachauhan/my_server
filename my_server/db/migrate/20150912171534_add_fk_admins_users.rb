class AddFkAdminsUsers < ActiveRecord::Migration
  def change
  	add_foreign_key :admins, :users, primary_key: :id #column: :id, #name: :id
  end
end
