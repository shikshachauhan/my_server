class CreateRecording < ActiveRecord::Migration
  def change
    create_table :recordings do |t|
      t.string :file_path
      t.timestamps
    end
  end
end
