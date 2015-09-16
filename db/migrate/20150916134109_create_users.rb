class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :display_name, null: false,
      t.string :email, null: false, index: true, unique: true
      t.string :password_hash, null: false

    end
    add_index :users, :display_name, unique: => true
    add_index :users, :email, unique: => true
  end
end
