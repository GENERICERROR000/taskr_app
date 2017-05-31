class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :address
      t.timestamp :start_date
      t.timestamp :end_date

      t.timestamps
    end
  end
end
