class AddLabelToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :label, :string, default: 'Bug'
    add_column :tasks, :points, :integer
  end
end
