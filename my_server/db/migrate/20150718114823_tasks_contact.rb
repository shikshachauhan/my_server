class TasksContact < ActiveRecord::Migration
  def change
    create_table :tasks_contact do |t|
      t.integer :task_id
      t.integer :user_id
      t.timestamps
    end
  end
end
