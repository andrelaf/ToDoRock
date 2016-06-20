class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.integer :priority, default: 1, null: false
      t.integer :status, default: 1, null: false
      t.integer :board_id, null: false

      t.timestamps null: false
    end
  end
end
