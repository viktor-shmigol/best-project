class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :name
      t.string :slug

      t.timestamps null: false
    end
    add_index :boards, :slug, unique: true
  end
end
