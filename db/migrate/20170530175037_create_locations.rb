class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.text :special_instructions
      t.references :event
      t.timestamps
    end
  end
end
