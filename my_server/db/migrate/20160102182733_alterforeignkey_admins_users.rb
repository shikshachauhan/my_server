class AlterforeignkeyAdminsUsers < ActiveRecord::Migration
  def change
  	remove_foreign_key :admins, :users
  	add_foreign_key :admins, :users
  end
end
