class AddActiveToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :active, :boolean, default: true, null: false
  end
end
