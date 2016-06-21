class AddActiveToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :active, :boolean, default: true, null: false
  end
end
