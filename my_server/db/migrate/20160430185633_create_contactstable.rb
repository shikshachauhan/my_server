class CreateContactstable < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
    	t.integer :MemberId
    	t.string :Name
    	t.string :Number
    	t.string :Gender
    	t.string :Clist_ids
    	t.string :Resource_uri
    	t.integer :Age
    	t.string :District
    	t.string :State
    	t.string :Block
    	t.string :Status
    	t.integer :GVID
    	t.timestamps
    end
  end
end
