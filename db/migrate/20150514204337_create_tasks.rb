class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string  :title
      t.date    :due_date
      t.integer :task_list_id
      t.integer :board_id
      t.string  :description
      t.string  :status
      t.integer :position

      t.timestamps
    end
  end
end
