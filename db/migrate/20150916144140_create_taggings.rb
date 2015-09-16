class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :tag, index: true, null: false
      t.belongs_to :question, index: true, null: false

      t.timestamps null: false
    end
  end
end
