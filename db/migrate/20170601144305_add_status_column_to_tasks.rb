class AddStatusColumnToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :status, :string, default: "open"
  end
end
