class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.references :event, foreign_key: true
      t.references :location, foreign_key: true
      t.string :task_location
      t.string :end_location
      t.text :description
      t.integer :priority

      t.timestamps
    end
  end
end
