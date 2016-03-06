class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, unique: true
      t.string :token
      t.string :password_hash
      t.string :slug
    end
    add_index :users, :slug, unique: true
  end
end
