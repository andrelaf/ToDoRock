class RemoveColorFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :color, :integer
  end
end
