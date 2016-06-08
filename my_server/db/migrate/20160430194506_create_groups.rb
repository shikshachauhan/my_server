class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.integer :MemberId
    	t.string :Name
    	t.string :Status
    	t.integer :GVID
    	t.timestamps
    end
  end
end
