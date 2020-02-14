class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :content
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
