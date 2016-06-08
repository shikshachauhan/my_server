class ChangeNgoUsersPhoneStringToInteger < ActiveRecord::Migration
  def up
    change_column :ngo_users, :phone, :integer
  end

  def down
    change_column :ngo_users, :phone, :string
  end
end
