class AddIndexToTasksBoardId < ActiveRecord::Migration
  def change
    add_index :tasks, :board_id
  end
end
