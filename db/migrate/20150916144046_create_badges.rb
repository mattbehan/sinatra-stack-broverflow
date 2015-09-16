class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :badge_name, null: false
      t.string :badge_image, null: false
      t.string :badge_level, null: false

      t.timestamps null: false
    end
  end
end
