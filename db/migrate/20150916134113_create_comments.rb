class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true, index: true
      t.belongs_to :user, index: true, null: false
      t.text :comment_text, null: false

      t.timestamps null: false
    end
  end
end
