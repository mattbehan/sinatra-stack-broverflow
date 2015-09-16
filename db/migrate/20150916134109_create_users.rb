class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :display_name, null: false
      t.string :email, null: false
      t.string :password_hash, null: false
      t.string :location
      t.date :birthday
      t.text :bio
      t.string :website_link
      t.string :twitter_link
      t.string :github_link

    end
    add_index :users, :display_name, unique: true
    add_index :users, :email, unique: true
  end
end
