class ChangeNgoUsersPhoneIncreaseLength < ActiveRecord::Migration
  def up
    change_column :ngo_users, :phone, :integer, :limit => 8
  end

  def down
    change_column :ngo_users, :phone, :integer
  end
end
