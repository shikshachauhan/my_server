class CreateSurvey < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :file_path
      t.timestamps
    end
  end
end
