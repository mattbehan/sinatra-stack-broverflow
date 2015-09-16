class CreateUsersBadges < ActiveRecord::Migration
  def change
    create_table :users_badges do |t|
      t.belongs_to :badge, null: false, index: true
      t.belongs_to :user, null: false, index: true
    end
  end
end
