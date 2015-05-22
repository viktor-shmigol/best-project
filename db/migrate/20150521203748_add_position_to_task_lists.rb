class AddPositionToTaskLists < ActiveRecord::Migration
  def change
    add_column :task_lists, :position, :integer
  end
end
